from rest_framework.exceptions import APIException
from ..models import Rating
from ..models import AddedDishRating
from ..models import AddedRating
from ..models import Dish
from ..models import Restaurant
from ..models import User
from ..models import Token
from ..models import AddedRating
from rest_framework.exceptions import NotFound
from django.core.exceptions import ObjectDoesNotExist
from .ValidationService import ValidationService
from django.db import IntegrityError
from ..enums.RatingEnums import VerifiedStatus
from .ValidationService import ValidationService

class RatingService:

    def __init__(self):
        self.data = [];

    def add_rating(self, data):
        # retrieve request data
        try:
            username = data['user']
            token_number = data['token_number'] #token number 
            rest_id = data['restaurant_id'] #restaurant id #required
            dish_id = data['dish_id'] #dish id
            dish_rating = data['dish_rating'] #dish rating #required
            price_rating = data['price_rating'] #price rating #required
            service_rating = data['service_rating'] #service rating #required
            review = data['review'] #review #required
        except KeyError as e:
            raise APIException(f"Key {e} not exists in the request")

        # validate request data for null or empty values
        if(not ValidationService.isset(value=rest_id)):
            raise APIException("Restaurant id is empty")

        if(not ValidationService.isset(value=price_rating)):
            raise APIException("Price rating is empty")

        if(not ValidationService.isset(value=service_rating)):
            raise APIException("Service rating is empty")    

        if(not ValidationService.isset(value=review)):
            raise APIException("Review is empty") 

        # validate request data values for db existance
        if(not isinstance(username, str)):
            raise APIException("Username should be string")

        # dish rating integer validation
        # dish rating range validation
        if(not ValidationService.is_valid_rating(dish_rating)):
            raise APIException("Invalid dish rating")

        # price rating integer validation
        # price rating range validation
        if(not ValidationService.is_valid_rating(price_rating)):
            raise APIException("Invalid price rating")        

        # service rating integer valiation
        # service rating range validation
        if(not ValidationService.is_valid_rating(service_rating)):
            raise APIException("Invalid service rating")        

        # check user exists
        # check whether the username exists

        # user = User.objects.get(username=username)
        # if(not user):
        #     raise APIException(f"Username name '{username}' not exists")

        try:
            user = User.objects.get(username=username)
        except ObjectDoesNotExist as e:
            raise APIException(f"Username name '{username}' not exists")
            
        # check user logged in

        # validate restaurant id
        # check whether the restaurant id exists

        # restaurant = Restaurant.objects.get(restaurant_id=rest_id)

        # if(not restaurant):
        #     raise APIException(f"Restaurant id '{rest_id}' not exists")
        
        try:
            restaurant = Restaurant.objects.get(restaurant_id=rest_id)
        except ObjectDoesNotExist as e:
            raise APIException(f"Restaurant id '{rest_id}' not exists")

        # validate dish id(if exists)
        # dish = Dish.objects.get(dish_id=dish_id)

        # if(not dish):
        #     raise APIException(f"Dish id '{dish_id}' not exists")
        if(dish_id != None):            
            try:
                dish = Dish.objects.get(dish_id=dish_id)
            except ObjectDoesNotExist as e:
                raise APIException(f"Dish id '{dish_id}' not exists")

        # token = Token.objects.get(token_number=token_number, restaurant=restaurant)

        # if(not token):
        #     raise APIException(f"Token number '{token_number}' not exists")

        try:
            token = Token.objects.get(token_number=token_number)
        except ObjectDoesNotExist as e:
            token = None
            raise APIException(f"Token number '{token_number}' not exists")

        try:
            token = Token.objects.get(token_number=token_number, restaurant=restaurant)
        except ObjectDoesNotExist as e:
            token = None
            raise APIException(f"Token number '{token_number}' not exists for the restaurant")

        # validate rating categories

        if(token == None):
            verified = VerifiedStatus.Unverified.value
        else:
            # validate token number
            verified = VerifiedStatus.Verified.value

        rating = Rating(
          dish_rating = dish_rating,
          price_rating = price_rating,
          service_rating = service_rating,
          verified = verified,
          created_on = "2020-06-26")

        try: 
            rating.save()
        except IntegrityError as e:
            raise APIException(e)   

        if(dish_id != None):
            added_dish_rating = AddedDishRating(
            rating = rating,
            restaurant = restaurant,
            dish = dish,
            user = user,
            token_number = token)
            try: 
                # pass
                added_dish_rating.save()
            except IntegrityError as e:
                raise APIException(e)
        else:
            added_rating = AddedRating(
                rating = rating,
                restaurant = restaurant,
                user = user,
                token_number = token
                )

            try: 
                added_rating.save()
            except IntegrityError as e:
                raise APIException(e)    

        # add contribution points to the user

        # this should be change by using response model
        resp={
            "success": True,
            "code": 200,
            "message": "success AddRating",
            "data": {
                "rated_by": user.username,
                "verified": VerifiedStatus(rating.verified).name,
                "restaurant_id": restaurant.restaurant_id,
                "dish_id": dish.dish_id if dish_id != None else None,
                "dish_rating": rating.dish_rating,
                "price_rating": rating.price_rating,
                "service_rating": rating.service_rating
            }
        }

        return resp  

    def get_rating(self, data):
        # rest_id = 1;
        # added_ratings = AddedRating.objects.get(restaurant_id=rest_id);
        # added_dish_ratings = AddedDishRating.objects.get(restaurant_id=rest_id);
        pass

    def get_ratings_for_restaurant(rest_id):
        added_ratings = AddedRating.objects.raw('SELECT added_rating.rating_id, dish_rating, price_rating, service_rating FROM added_rating INNER JOIN rating ON added_rating.rating_id=rating.rating_id WHERE restaurant_id=%s', [rest_id]);
        added_dish_ratings = AddedDishRating.objects.raw('SELECT added_dish_rating.rating_id, dish_rating, price_rating, service_rating FROM added_dish_rating INNER JOIN rating ON added_dish_rating.rating_id=rating.rating_id WHERE restaurant_id=%s', [rest_id]);
        # print(added_dish_ratings)
        print(added_ratings)
        dish_rating = 0
        price_rating = 0
        service_rating = 0
        total_no_of_ratings = 0;
        overall_rating = 0
        for rating in added_ratings:
            total_no_of_ratings = total_no_of_ratings+1
            dish_rating = dish_rating + rating.dish_rating
            price_rating = price_rating + rating.price_rating
            service_rating = service_rating + rating.service_rating

        for rating in added_dish_ratings:
            total_no_of_ratings = total_no_of_ratings+1
            dish_rating = dish_rating + rating.dish_rating
            price_rating = price_rating + rating.price_rating
            service_rating = service_rating + rating.service_rating

        if(total_no_of_ratings!=0):
            dish_rating = dish_rating/total_no_of_ratings
            price_rating = price_rating/total_no_of_ratings
            service_rating = service_rating/total_no_of_ratings
            overall_rating = (dish_rating+price_rating+service_rating)/3

        resp={
            "success": True,
            "code": 200,
            "message": "success GetRating",
            "data": {
                "restaurant_id": rest_id,
                "total_no_of_ratings": total_no_of_ratings,
                "dish_rating": dish_rating,
                "price_rating": price_rating,
                "service_rating": service_rating,
                "overall_rating": overall_rating
            }
        }

        return resp;
        pass

    def get_ratings_for_restaurant_dish(rest_id, dish_id):
        rest_id = 23
        dish_id = 2
        # added_ratings = AddedRating.objects.raw('SELECT added_rating.rating_id, dish_rating, price_rating, service_rating FROM added_rating INNER JOIN rating ON added_rating.rating_id=rating.rating_id WHERE restaurant_id=%s', [rest_id]);
        added_dish_ratings = AddedDishRating.objects.raw('SELECT added_dish_rating.rating_id, dish_rating, price_rating, service_rating FROM added_dish_rating INNER JOIN rating ON added_dish_rating.rating_id=rating.rating_id WHERE restaurant_id=%s AND dish_id=%s', [rest_id, dish_id]);
        # print(added_dish_ratings)
        print(added_ratings)
        dish_rating = 0
        price_rating = 0
        service_rating = 0
        total_no_of_ratings = 0;
        overall_rating = 0
        # for rating in added_ratings:
        #     total_no_of_ratings = total_no_of_ratings+1
        #     dish_rating = dish_rating + rating.dish_rating
        #     price_rating = price_rating + rating.price_rating
        #     service_rating = service_rating + rating.service_rating

        for rating in added_dish_ratings:
            total_no_of_ratings = total_no_of_ratings+1
            dish_rating = dish_rating + rating.dish_rating
            price_rating = price_rating + rating.price_rating
            service_rating = service_rating + rating.service_rating

        if(total_no_of_ratings!=0):
            dish_rating = dish_rating/total_no_of_ratings
            price_rating = price_rating/total_no_of_ratings
            service_rating = service_rating/total_no_of_ratings
            overall_rating = (dish_rating+price_rating+service_rating)/3

        resp={
            "success": True,
            "code": 200,
            "message": "success GetDishRating",
            "data": {
                "restaurant_id": rest_id,
                "dish_id": dish_id,
                "total_no_of_ratings": total_no_of_ratings,
                "dish_rating": dish_rating,
                "price_rating": price_rating,
                "service_rating": service_rating,
                "overall_rating": overall_dish_rating
            }
        }

        return resp;
        pass

    def get_ratings_for_dish(dish_id):
        added_dish_ratings = AddedDishRating.objects.raw('SELECT added_dish_rating.rating_id, dish_rating, price_rating, service_rating FROM added_dish_rating INNER JOIN rating ON added_dish_rating.rating_id=rating.rating_id WHERE dish_id=%s', [dish_id]);
        pass

    def delete_rating(self, data):
        # rest_id = data['restaurant_id']
        # ratings = Rating.objects.raw()
        # rating_id = 2
        # ratings = AddedRating.objects.raw('SELECT * FROM added_rating INNER JOIN rating ON added_rating.rating=rating.rating_id WHERE rating.rating_id=rating_id')
        pass;