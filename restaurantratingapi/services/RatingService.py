from rest_framework.exceptions import APIException
from ..models import Rating
from ..models import AddedDishRating
from ..models import Dish
from ..models import Restaurant
from rest_framework.exceptions import NotFound
from .ValidationService import ValidationService

class RatingService:

	def __init__(self):
		self.data = [];

	def add_rating(self, data):
        # retrieve request data
        try:
            username = data['user']
            token = data['token_number'] #token number 
            rest_id = data['restaurant_id'] #restaurant id #required
            # rating = data['rating'];
            dish_id = data['dish_id'] #dish id
            dish_rating = data['dish_rating'] #dish rating #required
            price_rating = data['price_rating'] #price rating #required
            service_rating = data['service_rating'] #service rating #required
            review = data['review'] #review #required
            # rest_longitude = data['longitude'] #restaurant GEO location-longitude #required
            # rest_latitude = data['latitude'] #restaurant GEO location-latitude #required
            # selected_role = data['role'] #user's requested role for the restaurant
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

        # price rating integer validation
        # price rating range validation

        # service rating integer valiation
        # service rating range validation

        # check user exists
        # check whether the username exists
        if(not User.objects.filter(username=username).exists()):
            raise APIException(f"Username name '{username}' not exists")
            
        # check user logged in

        # validate restaurant id
        # check whether the restaurant id exists
        if(not Restaurant.objects.filter(id=rest_id).exists()):
            raise APIException(f"Restaurant id '{rest_id}' not exists")

        # validate dish id(if exists)
        if(not Dish.objects.filter(id=dish_id).exists()):
            raise APIException(f"Dish id '{dish_id}' not exists")

        # validate rating categories

        if(token == null)
        {
          varified = 0
        }
        else
        {
          # validate token number
          varified = 1
        }

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

        if(dish_id != null)
        {
            added_dish_rating = AddedDishRating(
                rating = 1,
                restaurant = rest_id,
                dish = dish_id,
                user = user,
                token_number = token_number)
         
        }

        try: 
            added_dish_rating.save()
        except IntegrityError as e:
            raise APIException(e)   

        # add contribution points to the user

	def delete_rating(self, data):
		pass;