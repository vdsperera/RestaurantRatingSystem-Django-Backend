from .ValidationService import ValidationService
from .SystemService import SystemService
from ..enums.RestaurantEnums import ClaimStatus, RestaurantComponents
from ..enums.ContributionEnums import ContributionTypes
from ..enums.UserEnums import UserRoles
from ..enums.HistoryEnums import EditHistoryStatus
from ..models import Restaurant
from django.contrib.auth.models import User
from ..models import CustomUser
from..models import EditHistory
from..models import EditComponent
from..models import UserEditHistoryComponent
from..models import UserEditHistoryConfirmation
from rest_framework.exceptions import APIException
from rest_framework.exceptions import NotFound
from django.db import IntegrityError
from django.core.validators import RegexValidator
import re
from .RatingService import RatingService
from ..models import Rating
from ..models import Dish
from ..models import RestaurantDish
from django.core.exceptions import ObjectDoesNotExist
import string
from django.db import transaction


class RestaurantService:

    def __init__(self):
        pass

    def register_restaurant(self, data):

        # retrieve request data
        try:
            username = data['user']
            rest_name = data['name'] #restaurant name #required
            # rest_address = data['address'] #restaurant address
            rest_street = data['address']['street_address'] + ', '
            rest_city = string.capwords(data['address']['city'])
            print(rest_street+ rest_city)
            rest_pnumber = data['phone_number'] #restaurant phone number
            # rest_added_by = data['user'] #restaurant is added by #required
            # rest_owner = data['owner'] #owner of the restaurant
            rest_longitude = data['longitude'] #restaurant GEO location-longitude #required
            rest_latitude = data['latitude'] #restaurant GEO location-latitude #required
            selected_role = data['role'] #user's requested role for the restaurant
            dishes = data['dishes']
        except KeyError as e:
            print(f"Key {e} not exists in the request")
            raise APIException(f"Key {e} not exists in the request")

        # set default values
        rest_code = SystemService.generate_restaurant_code()
        rest_claimed = ClaimStatus.Unclaimed.value
        rest_owner = None
        rest_address = data['address']['street_address'] + ', ' + data['address']['city']

        # validate request data for null or empty values
        if(not ValidationService.isset(value=rest_name)):
            raise APIException("Restaurant name is empty")

        if(not ValidationService.isset(value=username)):
            raise APIException("User is empty")

        if(not ValidationService.isset(value=rest_city)):
            raise APIException("City is empty")

        if(not ValidationService.isset(value=rest_longitude)):
            raise APIException("Longitude is empty")    

        if(not ValidationService.isset(value=rest_latitude)):
            raise APIException("Latitude is empty")    



        # validate request data values

        if(not isinstance(username, str)):
            raise APIException("Username should be string")

        if(not isinstance(rest_name, str)):
            raise APIException("Restaurant name should be string")            

        if(not isinstance(rest_address, str)):
            raise APIException("Restaurant address should be string")

        if(not isinstance(selected_role, str)):
            raise APIException("Role should be string")     

        try:
            float(rest_longitude)
            rest_longitude = float(data['longitude'])   
        except:
            raise APIException("Longitude should be numeric")

        try:
            float(rest_latitude)
            rest_latitude = float(data['latitude'])   
        except:
            raise APIException("Latitude should be numeric")

        if(not ValidationService.is_geo_coordinate(rest_longitude,'lo')):
            raise APIException("Longitude is invalid")

        if(not ValidationService.is_geo_coordinate(rest_latitude,'la')):
            raise APIException("Latitude is invalid")

        
        # mobile_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
        if(not ValidationService.is_phone_number(rest_pnumber)):
            raise APIException("Phone number is invalid")

        # user = User.objects.get(username='vidumini')   

        #check whether the restaurant name already exists
        if(Restaurant.objects.filter(name=rest_name).exists()):
            raise APIException(f"Restaurant name '{rest_name}' already exists")

        #check whether the username already exists
        if(not User.objects.filter(username=username).exists()):
            raise APIException(f"Username name '{username}' not exists")
        
        user = User.objects.get(username=username)    

        # check whether the user is owner - raw sql should be replaced
        users = User.objects.raw('SELECT * FROM auth_user INNER JOIN auth_user_groups ON auth_user.id=auth_user_groups.user_id WHERE auth_user_groups.group_id=1 AND auth_user.username=%s', [username])

        # print(type(users))
        if(not users):
            print("User is not an owner")
            if(selected_role=='owner'):
                raise APIException(f"User '{username}' currently not a owner")
                pass
                ###Redirect to customer-owner transformation process and end current process###
        else:
            print("User is an owner")
            rest_owner = user
            rest_claimed = ClaimStatus.Pending.value
            ### Need to send generated code ###

        # for u in users:
        #     print(u)

        # create restaurant - need to handle exceptions
        rest = Restaurant(
            name=rest_name,
            address=rest_address,
            longitude=rest_longitude,
            latitude=rest_latitude,            
            phone_number=rest_pnumber,
            claimed=rest_claimed,
            claimed_by=rest_owner,
            code=rest_code,
            created_by=user)      
         
        try: 
            rest.save()
        except IntegrityError as e:
            raise APIException(e)
        
        print(rest_owner.id if rest_owner != None else None)
        # print(type(rest))

        ### Need to add contribution points to the user ###
        # print(ContributionTypes.AddVerifiedDishRating.name)
        if(not users):
            system_service = SystemService()
            system_service.add_contribution_points(ContributionTypes.AddRestaurant.value, user)


        # this should be change by using response model
        resp={
            "success": True,
            "code": 200,
            "message": "success RegisterRestaurant",
            "data": {
                "restaurant_id": rest.restaurant_id,
                "restaurant_name": rest.name,
                "address": rest.address,
                "logitude": rest.longitude,
                "latitude": rest.latitude,        
                "phone_number": rest.phone_number,
                "added_by": rest.created_by.id,
                "claimed_by": rest_owner.id if rest_owner != None else None,
                "code": rest.code,
                "claimed_status": ClaimStatus(rest.claimed).name,
                "created_on": rest.created_on
            }
        }

        if(ValidationService.isset(value=dishes) and dishes):
            for dish in dishes:
                # print((dish))
                dish_data = {
                    "user": username,
                    "restaurant_id": rest.restaurant_id,
                    "dish_id": dish['dish_id'],
                    "dish_name": dish['dish_name']                
                }
                # print(dish_data)
                self.add_dishes_for_the_restaurant(dish_data)
        
        



        return resp   

    def claim_restaurant(self, data):
        # return 'claim restaurant'
        # retrieve request data
        try:
            username = data['user']
            # rest_name = data['name'] #restaurant name #required
            rest_id = data['restaurant_id']
            rest_code = data['restaurant_code']
        except KeyError as e:
            print(f"Key {e} not exists in the request")
            raise APIException(f"Key {e} not exists in the request")

        # validate request data for null or empty values
        if(not ValidationService.isset(value=username)):
            raise APIException("User is empty")

        if(not ValidationService.isset(value=rest_id)):
            raise APIException("Restaurant ID is empty")

        # if(not ValidationService.isset(value=rest_code)):
        #     raise APIException("Restaurant code is empty")

        user = User.objects.get(username=username)   

        if(not user):
            raise APIException(f"User not exists")

        restaurant = Restaurant.objects.filter(restaurant_id=rest_id)

        if(not restaurant.exists()):
            raise APIException(f"Restaurant not exists")

        custom_user = CustomUser.objects.get(user=user)

        if(UserRoles.Owner.value != custom_user.role_id.role_id):
            raise APIException(f"User is not an owner")

        if(restaurant[0].claimed == ClaimStatus.Claimed.value):
            raise APIException(f"Already claimed restaurant")


        if(not ValidationService.isset(value=rest_code)):
            # request = 0
            if(restaurant[0].claimed == ClaimStatus.Pending.value):
                raise APIException(f"Already pending restaurant")
            restaurant_model = restaurant[0];
            restaurant_model.claimed = ClaimStatus.Pending.value
            pass
        else:
            # request = 1
            if(restaurant[0].code != rest_code):
                raise APIException(f"Invalid code")

            restaurant_model = restaurant[0];
            restaurant_model.claimed = ClaimStatus.Claimed.value
            restaurant_model.claimed_by = user

        try:
            # restaurant_model = restaurant[0];
            restaurant_model.save()
        except ObjectDoesNotExist as e:
            raise APIException(f"Process failed")

        # if(request == 0):
        #     pass
        # if(request == 1):
            # if(restaurant[0].code != rest_code):
            #     raise APIException(f"Invalid code")

        resp = {
                "success": True,
                "code": 200,
                "message": "success ClaimRestaurant",
                "data": {
                  "restaurant_id": restaurant[0].restaurant_id,
                  "owner": user.username,
                  "status": ClaimStatus(restaurant[0].claimed).name
                }
                }

        return resp

        
    def de_register_restaurant():
        pass    
        
    def get_restaurant(self, data):

        rest = Restaurant.objects.get(restaurant_id=data)
        rating_svc = RatingService
        rating_resp = rating_svc.get_ratings_for_restaurant(self, data)
        dishes = Dish.objects.raw("""
            SELECT restaurant_id, dish.dish_id as dish_id,
            dish_name, restaurant_dish.status as status
            FROM dish 
            INNER JOIN restaurant_dish
            ON dish.dish_id=restaurant_dish.dish_id
            WHERE restaurant_id=%s
            """, [data])
        print(rating_resp['data'])
        # return rest.restaurant_id
        dish_list = []
        for item in dishes:
            dish = {
            "dish_id":item.dish_id,
            "dish_name":item.dish_name,
            "added_status": item.status
            }
            dish_list.append(dish)

        resp={
            "success": True,
            "code": 200,
            "message": "success GetRestaurant",
            "data": {
                "restaurant_id": rest.restaurant_id,
                "restaurant_name": rest.name,
                "dishes": dish_list,
                "address": rest.address,
                "logitude": rest.longitude,
                "latitude": rest.latitude,        
                "phone_number": rest.phone_number,
                "added_by": rest.created_by.username,
                "claimed_by": rest.claimed_by.username if rest.claimed_by != None else None,
                "code": rest.code,
                "claimed_status": ClaimStatus(rest.claimed).name,
                "created_on": rest.created_on,
                "total_no_of_ratings": rating_resp['data']['total_no_of_ratings'],
                "dish_rating": rating_resp['data']['dish_rating'],
                "price_rating": rating_resp['data']['price_rating'],
                "service_rating": rating_resp['data']['service_rating'],
                "overall_rating": rating_resp['data']['overall_rating'],
                "ratings": rating_resp['data']['ratings']
            }
        }

        return resp;

    ## should check with activity diagram
    def get_restaurant_list(self, data):
        # return 'get restaurant list'
        # rest = Restaurant.objects.get()

        restaurant_list = Restaurant.objects.raw("""
            SELECT *
            FROM restaurant
            """)

        list = []
        for rest in restaurant_list:
            rating_svc = RatingService
            rating_resp = rating_svc.get_ratings_for_restaurant(self, rest.restaurant_id)

            restaurant_model = {
                "restaurant_id": rest.restaurant_id,
                "restaurant_name": rest.name,
                "address": rest.address,
                "logitude": rest.longitude,
                "latitude": rest.latitude,        
                "phone_number": rest.phone_number,
                "added_by": rest.created_by.username,
                "claimed_by": rest.claimed_by.username if rest.claimed_by != None else None,
                "code": rest.code,
                "claimed_status": ClaimStatus(rest.claimed).name,
                "created_on": rest.created_on,
                "total_no_of_ratings": rating_resp['data']['total_no_of_ratings'],
                "dish_rating": rating_resp['data']['dish_rating'],
                "price_rating": rating_resp['data']['price_rating'],
                "service_rating": rating_resp['data']['service_rating'],
                "overall_rating": rating_resp['data']['overall_rating']
            }
            list.append(restaurant_model)

        # rating_svc = RatingService
        # rating_resp = rating_svc.get_ratings_for_restaurant(self, data)
        list.sort(key = lambda x: x['overall_rating'], reverse=True)
        resp = {
            "success": True,
            "code": 200,
            "message": "success GetRestaurantList",
            "data": {
                "restaurant_list": list
            }
        }
        return resp
        pass

    # not pre planned
    def get_restaurant_list_for_dish(self, dish_id):
        # return 'get restaurant list'
        # rest = Restaurant.objects.get()
        # myDict = dict(self.request.query_params)
        restaurant_list = Restaurant.objects.raw("""
            SELECT *
            FROM restaurant

            """)

        list = []
        for rest in restaurant_list:
            rating_svc = RatingService
            rating_resp = rating_svc.get_ratings_for_restaurant_dish(rest.restaurant_id, dish_id)
            # print(rating_resp['data']['total_no_of_ratings'])
            if rating_resp['data']['total_no_of_ratings'] == 0:
                continue

            restaurant_model = {
                "restaurant_id": rest.restaurant_id,
                "restaurant_name": rest.name,
                "address": rest.address,
                "logitude": rest.longitude,
                "latitude": rest.latitude,        
                "phone_number": rest.phone_number,
                "added_by": rest.created_by.username,
                "claimed_by": rest.claimed_by.username if rest.claimed_by != None else None,
                "code": rest.code,
                "claimed_status": ClaimStatus(rest.claimed).name,
                "created_on": rest.created_on,
                "total_no_of_ratings": rating_resp['data']['total_no_of_ratings'],
                "dish_rating": rating_resp['data']['dish_rating'],
                "price_rating": rating_resp['data']['price_rating'],
                "service_rating": rating_resp['data']['service_rating'],
                "overall_rating": rating_resp['data']['overall_rating']
            }
            list.append(restaurant_model)

        # rating_svc = RatingService
        # rating_resp = rating_svc.get_ratings_for_restaurant(self, data)
        list.sort(key = lambda x: x['overall_rating'], reverse=True)
        resp = {
            "success": True,
            "code": 200,
            "message": "success GetRestaurantList",
            "data": {
                "restaurant_list": list
            }
        }
        return resp
        pass
    # 


    def add_dishes_for_the_restaurant(self, data):

        # retrieve request data
        req_user = data["user"]
        req_restaurant_id = data["restaurant_id"]
        req_dish_id = data["dish_id"]
        req_dish_name = data["dish_name"]
        new_dish = False
        system_service = SystemService()

        # validate request data for null or empty values
        # 
        # 
        if(not ValidationService.isset(value=req_dish_id)):
            if(not ValidationService.isset(value=req_dish_name)):
                raise APIException("Dish name is empty")
            new_dish = True

        # validate request data types
        # 
        # 

        # set defaults
        # 
        # 
        status = 0
        owner = False

        # validate request data for existance in db
        # 
        # 
        # new to check already exists dish name
        # 
        # 
        try: 
            restaurant = Restaurant.objects.get(restaurant_id=req_restaurant_id)
        except IntegrityError as e:
            raise APIException("Restaurant is not available in the system")

        try:
            user = User.objects.get(username=req_user)
        except ObjectDoesNotExist as e:
            raise APIException(f"Username name '{req_user}' not exists")


        ## check whether user is other restaurant owner, this restaurant owner or customer
        custom_user = CustomUser.objects.get(user_id=user)
        if(custom_user.role_id.role_id == 1):
            owner = True
            claimed_rest = Restaurant.objects.filter(restaurant_id=restaurant.restaurant_id, claimed_by=user)
            if(claimed_rest.exists() == False):
                return 'operation not permited(only allowed for restaurant owner)'


        if(new_dish == False):
            print('not new')
            # dishC = RestaurantDish.objects.get(dish_id=re, restaurant=restaurant)
            # print('print')
            # print(dishC)
            # try:
            #     dish = Dish.objects.get(dish_id=req_dish_id)
            # except:
            #     # new_dish = Dish(
            #     #     dish_name=)
            #     raise APIException("Dish is not available in the system")
            #     # pass
            dish = Dish.objects.filter(dish_id=req_dish_id)
            print(dish[0].status)
            if(dish.exists() == True):
                if(dish[0].status == 1):
                    dish = dish
                elif(dish[0].status == 0):
                    raise APIException("Dish is in pending status for the system")
                elif(dish[0].status == 2):
                    raise APIException("Dish is in rejected status for the system")
            else:
                raise APIException("Dish is not available in the system")

            restaurantdish = None
            restaurantdish = RestaurantDish.objects.filter(dish=dish[0].dish_id, restaurant=restaurant) 
            # restaurantdish = RestaurantDish.objects.raw("""
            #     SELECT *
            #     FROM restaurant_dish
            #     WHERE dish_id = %s & restaurant_id = %s
            #     """, [req_dish_id, req_restaurant_id]) 
              
            # for item in restaurantdish:
            #     print(item) 
            print(restaurantdish)

            if(restaurantdish.exists() == True):
                print(restaurantdish)
                if(restaurantdish[0].status == 1):
                    raise APIException("Dish is already in the restaurant")
                elif(restaurantdish[0].status == 0):
                    raise APIException("Dish is in pending status for this restaurant")
                elif(restaurantdish[0].status == 2):
                    raise APIException("Dish is in rejected status for this restaurant")
                # if(restaurantdish[0].status == 1):
                #     raise APIException("Dish is already in the restaurant")
                # elif(restaurantdish[0].status  == 0):
                #     raise APIException("Dish is in pending status for this restaurant")
                # elif(restaurantdish[0].status  == 2):
                #     raise APIException("Dish is in rejected status for this restaurant")
                # if(restaurantdish[0].status == 1):
                #     raise APIException("Dish is already in the restaurant")
                # elif(restaurantdish[0].status  == 0):
                #     raise APIException("Dish is in pending status for this restaurant")
                # elif(restaurantdish[0].status  == 2):
                #     raise APIException("Dish is in rejected status for this restaurant")


            ## check whether dish is rejected one or already requested one
        else:
            req_dish = Dish.objects.filter(dish_name=req_dish_name)
            if(req_dish.exists() == True):
                if(req_dish[0].status == 1):
                    dish = req_dish
                    raise APIException("Dish is in already in the system")
                elif(req_dish[0].status == 0):
                    raise APIException("Dish is in pending status for the system")
                elif(req_dish[0].status == 2):
                    raise APIException("Dish is in rejected status for the system")
                
            else:
                dish = Dish(
                dish_name = req_dish_name,
                status = 1 if owner == True else 0,
                created_by = user,
                created_on = "2020-11-14"
                )
                try: 
                    dish.save()
                except IntegrityError as e:
                    raise APIException(e)

        added_dish = RestaurantDish(
            dish = dish[0],
            restaurant = restaurant,
            added_by = user,
            status = 1 if (owner == True or restaurant.claimed == 0) else 0,
            created_on = "2020-11-14"
            )
        # return 1
        try: 
            added_dish.save()
            system_service.add_contribution_points(ContributionTypes.AddDishToRestaurant.value, user)
        except IntegrityError as e:
            raise APIException(e)

        resp = {
            "success": True,
            "code": 200,
            "message": "success AddDIshesForRestaurant",
            "data": {
                "restaurant_id": added_dish.dish_id,
                "dish_id": dish[0].dish_id,
                "dish_name": dish[0].dish_name,
                "added_by": added_dish.added_by.username,
                "added_status": added_dish.status
            }
        }
        return resp


    def request_edit(self, data):

        username = data['user']
        restaurant_id = data['restaurant_id']
        component = data['component']
        current_value = data['current_value']
        new_value = data['new_value']
        is_owner = False


        edit_component = EditComponent.objects.filter(component_id = component)
        # print(editComponent[0].confirmation_point_level)

        if(not edit_component.exists()):
            return False

        user = User.objects.filter(username=username)
        # print(user.exists())
        custom_user = CustomUser.objects.filter(user_id=user[0].id)
        confirmation_points = custom_user[0].level_number.allocated_comfirmation_points
        # print(custom_user[0].level_number.allocated_comfirmation_points)

        user_role = custom_user[0].role_id.role_id
        if(user_role == UserRoles.Owner.value):
            is_owner = True
            # return True
        print(custom_user[0].role_id.role_name)
        # return 1

        restaurant = Restaurant.objects.filter(restaurant_id=restaurant_id, claimed_by=user[0])
        print("restaurant exists", restaurant.exists())
        if(is_owner == True):
            print("path 01")
            if(restaurant.exists() == False):
                print("path 01_01")
                return APIException("Restaurant not owned by this user")
            else:
                print("path 01 02")
                # return True
                confirmation_points = edit_component[0].confirmation_point_level
                try:
                    with transaction.atomic():
                        history = self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 2, confirmation_points)
                        self.update_restaurant_component_value(component, restaurant[0], new_value)
                except:
                    raise APIException("Fail")

                # self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 2, confirmation_points)

                # edit_history = EditHistory(
                #     current_value = current_value,
                #     requested_value = new_value,
                #     status = 1,
                #     confirmed_by = user[0]
                #     )
                # # edit_history.save()

                # user_edit_history_component = UserEditHistoryComponent(
                #     user = user[0],
                #     history = edit_history,
                #     restaurant = restaurant[0],
                #     component = edit_component[0])
                # # user_edit_history_component.save()

                # user_edit_history_confirmation = UserEditHistoryConfirmation(
                #     user = user[0],
                #     history = edit_history,
                #     confirmation_points = edit_component[0].confirmation_point_level)

                # edit_history.save()
                # user_edit_history_component.save()
                # user_edit_history_confirmation.save()

                # self.update_restaurant_component_value(component, restaurant[0], new_value)

                # if(component == RestaurantComponents.RestaurantAddress.value):
                #     restaurant[0].address = new_value
                # elif(component == RestaurantComponents.RestaurantEmail.value):
                #     pass
                #     # restaurant[0].email = new_value
                # elif(component == RestaurantComponents.RestaurantLocation):
                #     pass
                #     # restaurant[0].address = new_value
                # elif(component == RestaurantComponents.RestaurantName):
                #     restaurant[0].name = new_value
                # elif(component == RestaurantComponents.RestaurantWebsite):
                #     pass
                #     # restaurant[0].website = new_value
                # elif(component == RestaurantComponents.RestaurantPhoneNumber):
                #     restaurant[0].phone_number = new_value
                #     restaurant[0].save()
                pass
                # allow edit
        else:
            print("path 02")
            hasRecentChangesByThisUser = False
            recent_edits = UserEditHistoryComponent.objects.raw("""
                SELECT uehc.id, uehc.history_id
                FROM user_edit_history_component as uehc
                INNER JOIN  edit_history as eh
                ON uehc.history_id = eh.history_id
                WHERE uehc.restaurant_id=%s
                AND uehc.component_id=%s
                AND uehc.user_id=%s
                AND eh.status=%s""", [restaurant_id, component,user[0].id, EditHistoryStatus.Pending.value])

            if(recent_edits):
                raise APIException("Recently edited by the user")


            hasRecentChangesByOtherUsers = False
            if(hasRecentChangesByThisUser):#check user has recent changes for the component
                print("path 02 01")
                return APIException("has recently edited")
            elif(hasRecentChangesByOtherUsers):
                # pass
                # path 01
                print("path 02 02")
                # yet to implement
                # try:
                #     with transaction.atomic():
                #         self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 2, confirmation_points)
                #         self.update_restaurant_component_value(component, restaurant[0], new_value)
                # except:
                #     raise APIException("Failed")

                # self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 2, confirmation_points)

                # edit_history = EditHistory(
                #     current_value = current_value,
                #     requested_value = new_value,
                #     status = 2,#approved
                #     confirmed_by = user[0]
                #     )
                # # edit_history.save()

                # user_edit_history_component = UserEditHistoryComponent(
                #     user = user[0],
                #     history = edit_history,
                #     restaurant = restaurant[0],
                #     component = editComponent[0])
                # # user_edit_history_component.save()

                # user_edit_history_confirmation = UserEditHistoryConfirmation(
                #     user = user[0],
                #     history = edit_history,
                #     confirmation_points = editComponent[0].confirmation_point_level)

                # # edit_history.save()
                # # user_edit_history_component.save()
                # # user_edit_history_confirmation.save()

                # self.update_restaurant_component_value(component, restaurant[0], new_value)

                # if(component == RestaurantComponents.RestaurantAddress.value):
                #     restaurant[0].address = new_value
                # elif(component == RestaurantComponents.RestaurantEmail.value):
                #     pass
                #     # restaurant[0].email = new_value
                # elif(component == RestaurantComponents.RestaurantLocation):
                #     pass
                #     # restaurant[0].address = new_value
                # elif(component == RestaurantComponents.RestaurantName):
                #     restaurant[0].name = new_value
                # elif(component == RestaurantComponents.RestaurantWebsite):
                #     pass
                #     # restaurant[0].website = new_value
                # elif(component == RestaurantComponents.RestaurantPhoneNumber):
                #     restaurant[0].phone_number = new_value
                #     restaurant[0].save()
            else:
                print("path 02 03")
                restaurant = Restaurant.objects.filter(restaurant_id=restaurant_id)
                print("claimed", restaurant[0].claimed )
                if(restaurant[0].claimed == 2):#claimed restaurant
                    print("path 02 03 01")
                    try:
                        with transaction.atomic():
                            history = self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 1, confirmation_points)
                    except:
                        raise APIException("Fail")

                    # self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 1, confirmation_points)

                    # edit_history = EditHistory(
                    #     current_value = current_value,
                    #     requested_value = new_value,
                    #     status = 0
                    #     )
                    # # edit_history.save()

                    # user_edit_history_component = UserEditHistoryComponent(
                    #     user = user[0],
                    #     history = edit_history,
                    #     restaurant = restaurant[0],
                    #     component = editComponent[0])
                    # # user_edit_history_component.save()

                    # user_edit_history_confirmation = UserEditHistoryConfirmation(
                    #     user = user[0],
                    #     history = edit_history,
                    #     confirmation_points = custom_user[0].level_number.allocated_comfirmation_points)
                    # user_edit_history_confirmation.save()
                else:
                    print("path 02 03 02")
                    confirmation_points = edit_component[0].confirmation_point_level
                    try:
                        with transaction.atomic():
                            history = self.set_history(user[0], restaurant[0], edit_component[0], current_value, new_value, 2, confirmation_points)
                            self.update_restaurant_component_value(component, restaurant[0], new_value)
                    except:
                        raise APIException("Fail")

                    # self.update_restaurant_component_value(component, restaurant[0], new_value)

                    # edit_history = EditHistory(
                    #     current_value = current_value,
                    #     requested_value = new_value,
                    #     status = 2,#approved
                    #     confirmed_by = user[0]
                    #     )
                    # # edit_history.save()

                    # user_edit_history_component = UserEditHistoryComponent(
                    #     user = user[0],
                    #     history = edit_history,
                    #     restaurant = restaurant[0],
                    #     component = editComponent[0])
                    # # user_edit_history_component.save()

                    # user_edit_history_confirmation = UserEditHistoryConfirmation(
                    #     user = user[0],
                    #     history = edit_history,
                    #     confirmation_points = editComponent[0].confirmation_point_level)

                    # edit_history.save()
                    # user_edit_history_component.save()
                    # user_edit_history_confirmation.save()

                    # self.update_restaurant_component_value(component, restaurant[0], new_value)

                    # if(component == RestaurantComponents.RestaurantAddress.value):
                    #     restaurant[0].address = new_value
                    # elif(component == RestaurantComponents.RestaurantEmail.value):
                    #     pass
                    #     # restaurant[0].email = new_value
                    # elif(component == RestaurantComponents.RestaurantLocation):
                    #     pass
                    #     # restaurant[0].address = new_value
                    # elif(component == RestaurantComponents.RestaurantName):
                    #     restaurant[0].name = new_value
                    # elif(component == RestaurantComponents.RestaurantWebsite):
                    #     pass
                    #     # restaurant[0].website = new_value
                    # elif(component == RestaurantComponents.RestaurantPhoneNumber):
                    #     restaurant[0].phone_number = new_value
                    #     restaurant[0].save()

            #check other users have recent changes for the component



        # return restaurant
        #check whether the username already exists
        # if(not User):
        #     raise APIException(f"Username name '{username}' not exists")
        # print(custom_user)
        # return user

        component_confirmation_level = edit_component[0].confirmation_point_level

        resp = {
            "success": True,
            "code": 200,
            "message": "success EditRestaurantComponent",
            "data": {
              "requested_by": username,
              "restaurant_id": restaurant_id,
              "component": edit_component[0].component_name,
              "current_value": current_value,
              "requested_value": new_value,
              "history_id": history['history_id'],
              "status": EditHistoryStatus(history['status']).name,
              "confirmation_point_level": component_confirmation_level,
              "current_points": history['current_points']
            }
        }

        return resp
        pass

    def set_history(self, user, restaurant, edit_component, current_value, new_value, status, confirmation_points):

        edit_history = EditHistory(
            current_value = current_value,
            requested_value = new_value,
            status = status,
            confirmed_by = user
            )
        edit_history.save()

        user_edit_history_component = UserEditHistoryComponent(
            user = user,
            history = edit_history,
            restaurant = restaurant,
            component = edit_component)
        user_edit_history_component.save()
        
        user_edit_history_confirmation = UserEditHistoryConfirmation(
        user = user,
        history = edit_history,
        confirmation_points = confirmation_points)



        # edit_history.save()
        # user_edit_history_component.save()
        user_edit_history_confirmation.save()   
        print('okkkkkkkk 1111')
        message = {
         "history_id": edit_history.history_id,
         "status": status,
         "current_points": confirmation_points
        }

        return message

    def update_restaurant_component_value(self, component, restaurant, new_value):
        print("update rest")
        print(restaurant)
        if(component == RestaurantComponents.RestaurantAddress.value):
            restaurant.address = new_value
        elif(component == RestaurantComponents.RestaurantEmail.value):
            pass
            # restaurant[0].email = new_value
        elif(component == RestaurantComponents.RestaurantLocation.value):
            pass
            # restaurant[0].address = new_value
        elif(component == RestaurantComponents.RestaurantName.value):
            print("rest name")
            restaurant.name = new_value
            print("rest name after", new_value)
        elif(component == RestaurantComponents.RestaurantWebsite.value):
            print("rest web")
            pass
            # restaurant[0].website = new_value
        elif(component == RestaurantComponents.RestaurantPhoneNumber.value):
            print("rest phone")
            restaurant.phone_number = new_value
        print("final")
        restaurant.save()     
        print('okkkkkkkk 2222')
        pass

    def approve_edit(self, data):
        history_id = data['history_id']
        username = data['user']
        approval = data['approval']

        user = User.objects.filter(username=username)

        if(not user.exists()):
            raise APIException("User not found")

        custom_user = CustomUser.objects.filter(user_id=user[0].id)
        confirmation_points = custom_user[0].level_number.allocated_comfirmation_points
        user_role = custom_user[0].role_id
        # print('Role is ', UserRoles(user_role.role_id).name)
        # print(UserRoles.Customer.value)
        edit_history = EditHistory.objects.filter(history_id = history_id)

        user_edit_history_component = UserEditHistoryComponent.objects.filter(history_id=edit_history[0])
        # print(user_edit_history_component[0].__dict__)
        # print(user_edit_history_component[0].restaurant_id)
        # return 1

        if(not edit_history.exists()):
            raise APIException("Not exists")

        if(edit_history[0].status == 0):
            raise APIException("Already Rejected")

        if(edit_history[0].status == 2):
            raise APIException("Already Approved")

        user_edit_history_confirmation = UserEditHistoryConfirmation.objects.filter(user_id=user[0].id, history_id=edit_history[0])

        # print(user_edit_history_confirmation)
        # return edit_history[0].status
        # return user_role.role_id == UserRoles.Owner.value or user_role.role_id == UserRoles.Admin.value
        if(user_edit_history_confirmation.exists()):
            raise APIException("Already submited")
        # return user_role.role_id == UserRoles.Owner.value
        if(user_role.role_id == UserRoles.Customer.value):
            if(approval == 'Approval'):
                try:
                    with transaction.atomic():
                        new_approval = UserEditHistoryConfirmation(
                            user = user[0],
                            history = edit_history[0],
                            confirmation_points = confirmation_points
                            )
                        new_approval.save()

                        user_edit_history_component = UserEditHistoryComponent.objects.filter(history_id=edit_history[0])
                        edit_component = EditComponent.objects.get(component_id=user_edit_history_component[0].component_id)
                        component_confirmation_level = edit_component.confirmation_point_level
                        # print("confirmation level", component_confirmation_level)

                        confimations = UserEditHistoryConfirmation.objects.raw("""
                            SELECT id, history_id, SUM(confirmation_points) AS total_confirmation_points
                            FROM user_edit_history_confirmation
                            WHERE history_id = %s
                            GROUP BY history_id
                            """, [history_id])
                        current_confirmation_points = confimations[0].total_confirmation_points
                        # print('current_confirmation_points ', current_confirmation_points)
                        if(current_confirmation_points >= component_confirmation_level):
                            # print()
                            # restaurant = user_edit_history_component[0].restaurant_id
                            restaurant = Restaurant.objects.get(restaurant_id=user_edit_history_component[0].restaurant_id)
                            print(restaurant)
                            self.update_restaurant_component_value(edit_component.component_id, restaurant, edit_history[0].requested_value)
                            # ed = EditHistory.objects.get(history_id=edit_history[0].history_id)
                            # ed.status = 2
                            # ed.save()
                            ed = edit_history[0]
                            ed.status = 2
                            ed.save()

                            # edit_history[0].status = 2
                            # edit_history[0].save()
                            # print('new value', edit_history[0].requested_value)

                            ### Add Contribution Points ###
                            ### add and reduce for all related users ###
                except:
                    raise APIException("failed")        
            elif(approval == 'Rejection'):
                try:
                    with transaction.atomic():
                        confirmation_points = -confirmation_points
                        new_approval = UserEditHistoryConfirmation(
                            user = user[0],
                            history = edit_history[0],
                            confirmation_points = confirmation_points
                            )
                        new_approval.save()

                        user_edit_history_component = UserEditHistoryComponent.objects.filter(history_id=edit_history[0])
                        edit_component = EditComponent.objects.get(component_id=user_edit_history_component[0].component_id)
                        component_confirmation_level = -edit_component.confirmation_point_level
                        # print("confirmation level", component_confirmation_level)

                        confimations = UserEditHistoryConfirmation.objects.raw("""
                            SELECT id, history_id, SUM(confirmation_points) AS total_confirmation_points
                            FROM user_edit_history_confirmation
                            WHERE history_id = %s
                            GROUP BY history_id
                            """, [history_id])
                        current_confirmation_points = confimations[0].total_confirmation_points
                        # print('current_confirmation_points ', current_confirmation_points)
                        if(current_confirmation_points <= component_confirmation_level):
                            # print()
                            # restaurant = user_edit_history_component[0].restaurant_id
                            # restaurant = Restaurant.objects.get(restaurant_id=user_edit_history_component[0].restaurant_id)
                            # print(restaurant)
                            # self.update_restaurant_component_value(edit_component.component_id, restaurant, edit_history[0].requested_value)
                            ed = edit_history[0]
                            ed.status = 0
                            ed.save()
                            # print("edit his id", edit_history[0].history_id)
                            # print("edit his status", edit_history[0].status)

                            ### Add Contribution Points ###
                            ### add and reduce for all related users ###
                except:
                    raise APIException("failed")  
        elif(user_role.role_id == UserRoles.Owner.value or user_role.role_id == UserRoles.Admin.value):
            # return 'Owner'
            user_edit_history_component = UserEditHistoryComponent.objects.filter(history_id=edit_history[0])
            # print(user_edit_history_component[0].restaurant)
            restaurant = Restaurant.objects.filter(restaurant_id=user_edit_history_component[0].restaurant.restaurant_id, claimed_by=user[0])
            # print(restaurant.exists())
            if(user_role.role_id == UserRoles.Owner.value and not restaurant.exists()):
                raise APIException('Not the owner of the restaurant')
            if(approval == 'Approval'):
                # return 'Owner App'
                try:
                    with transaction.atomic():

                        user_edit_history_component = UserEditHistoryComponent.objects.filter(history_id=edit_history[0])
                        edit_component = EditComponent.objects.get(component_id=user_edit_history_component[0].component_id)
                        component_confirmation_level = 2 * edit_component.confirmation_point_level
                        print("confirmation level", component_confirmation_level)

                        new_approval = UserEditHistoryConfirmation(
                            user = user[0],
                            history = edit_history[0],
                            confirmation_points = component_confirmation_level
                            )
                        new_approval.save()

                        confimations = UserEditHistoryConfirmation.objects.raw("""
                            SELECT id, history_id, SUM(confirmation_points) AS total_confirmation_points
                            FROM user_edit_history_confirmation
                            WHERE history_id = %s
                            GROUP BY history_id
                            """, [history_id])
                        current_confirmation_points = confimations[0].total_confirmation_points
                        # print('current_confirmation_points ', current_confirmation_points)
                        # if(current_confirmation_points >= component_confirmation_level):

                        # print()
                        # restaurant = user_edit_history_component[0].restaurant_id
                        restaurant = Restaurant.objects.get(restaurant_id=user_edit_history_component[0].restaurant_id)
                        # print(restaurant)
                        self.update_restaurant_component_value(edit_component.component_id, restaurant, edit_history[0].requested_value)
                        # ed = EditHistory.objects.get(history_id=edit_history[0].history_id)
                        # ed.status = 2
                        # ed.save()
                        ed = edit_history[0]
                        ed.status = 2
                        ed.save()

                        # edit_history[0].status = 2
                        # edit_history[0].save()
                        # print('new value', edit_history[0].requested_value)

                        ### Add Contribution Points ###
                        ### add and reduce for all related users ###
                except:
                    raise APIException("failed")        
            elif(approval == 'Rejection'):
                # return 'Owner Rej'
                try:
                    with transaction.atomic():
                        confirmation_points = -confirmation_points

                        user_edit_history_component = UserEditHistoryComponent.objects.filter(history_id=edit_history[0])
                        edit_component = EditComponent.objects.get(component_id=user_edit_history_component[0].component_id)
                        component_confirmation_level = 2 * -edit_component.confirmation_point_level
                        # print("confirmation level", component_confirmation_level)

                        new_approval = UserEditHistoryConfirmation(
                            user = user[0],
                            history = edit_history[0],
                            confirmation_points = component_confirmation_level
                            )
                        new_approval.save()

                        confimations = UserEditHistoryConfirmation.objects.raw("""
                            SELECT id, history_id, SUM(confirmation_points) AS total_confirmation_points
                            FROM user_edit_history_confirmation
                            WHERE history_id = %s
                            GROUP BY history_id
                            """, [history_id])
                        current_confirmation_points = confimations[0].total_confirmation_points
                        # print('current_confirmation_points ', current_confirmation_points)
                        # if(current_confirmation_points <= component_confirmation_level):

                        # print()
                        # restaurant = user_edit_history_component[0].restaurant_id
                        # restaurant = Restaurant.objects.get(restaurant_id=user_edit_history_component[0].restaurant_id)
                        # print(restaurant)
                        # self.update_restaurant_component_value(edit_component.component_id, restaurant, edit_history[0].requested_value)
                        ed = edit_history[0]
                        ed.status = 0
                        ed.save()
                        # print("edit his id", edit_history[0].history_id)
                        # print("edit his status", edit_history[0].status)

                            ### Add Contribution Points ###
                            ### add and reduce for all related users ###
                except:
                    raise APIException("failed")  

        resp = {
            "success": True,
            "code": 200,
            "message": "success ApproveRestaurantComponentEditRequest",
            "data": {
              "confirmed_by": username,
              "approval": approval,
              "requested_by": user_edit_history_component[0].user.username,
              "restaurant_id": user_edit_history_component[0].restaurant_id,
              "component": user_edit_history_component[0].component.component_name,
              "current_value": edit_history[0].current_value,
              "requested_value": edit_history[0].requested_value,
              "history_id": edit_history[0].history_id,
              "status": ed.status,
              "confirmation_point_level": user_edit_history_component[0].component.confirmation_point_level,
              "current_points": current_confirmation_points
            }
        }

        return resp



    def get_restaurants_edits_list(self, data):
        pass
        username = 'vidumini'
        edits = EditHistory.objects.raw("""
            SELECT history_id,current_value, requested_value
            FROM edit_history
            INNER JOIN user_edit_history_confirmation
            ON edit_history.history_id = user_edit_history_confirmation.history_id
            WHERE user_edit_history_confirmation.user_id != 2
            """)




