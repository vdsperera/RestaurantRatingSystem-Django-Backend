from django.utils.crypto import get_random_string
from ..models import Token
from ..models import Restaurant
from ..models import Contribution
from ..models import ContributionType
from django.contrib.auth.models import User
from rest_framework.exceptions import APIException
from rest_framework.exceptions import NotFound
from django.db import IntegrityError
import string
import random

class SystemService:

    def __init__(self):
        self.data = []
        
    @staticmethod
    def generate_restaurant_code():
        return get_random_string(length=20)

    @staticmethod
    def id_generator(size=10, chars=string.ascii_uppercase + string.digits):
        return ''.join(random.choice(chars) for _ in range(size))

    def generate_tokens_for_restaurant(self, data):
        # print(data)
        restaurant_id = data['restaurant_id']
        username = data['user']
        generate_size = data['generate_size']

        try: 
            restaurant = Restaurant.objects.get(restaurant_id=restaurant_id)
        except IntegrityError as e:
            raise APIException("Restaurant is not available in the system")

        try:
            user = User.objects.get(username=username)
        except ObjectDoesNotExist as e:
            raise APIException(f"Username name '{username}' not exists")

        # k=-2
        # n=0
        i=0
        token_number_list = []
        while i < generate_size:
            # print("i is "+str(i))
            # k = k + 1
            i = i + 1
            # print("k is "+str(k))
            token_number = SystemService.id_generator() 
            # if(k == -1):
            #     token_number = '#34A4344'
            # print(token_number)

            ## need to check randomly generated code is already generated?
            check_token = Token.objects.filter(token_number=token_number)
            # print(check_token.exists())

            if(check_token.exists()):
                i = i - 1
                # generate_size = generate_size+1
                # print("i-1 is "+str(i))
                continue
            try:
                token = Token(
                    token_number = token_number,
                    restaurant = restaurant,
                    created_on = '2020-11-15',
                    created_by = user
                    )
                token.save()
            except IntegrityError as e:
                raise APIException("Adding token is failed")
            # print(token.__dict__)
            token_number_model = {
              "token_number": token_number
            }
            token_number_list.append(token_number_model)

        resp = {
        "success": True,
        "code": 200,
        "message": "success GenerateTokesForRestaurant",
        "data": {
            "restaurant_id": restaurant_id,
            "generate_size": generate_size,
            "added_by": user.username,
            "tokens": token_number_list,
        }
        }

        return resp


    def get_tokens_for_restaurant(self, data):
        
        restaurant_id = data['restid'][0]
        # return restaurant_id
        try: 
            restaurant = Restaurant.objects.get(restaurant_id=restaurant_id)
        except IntegrityError as e:
            raise APIException("Restaurant is not available in the system")

        tokens = Token.objects.filter(restaurant=restaurant)
        print(tokens.exists())
        if(not tokens.exists()):
            raise APIException("Currently no token for this restaurant")

        token_list = []
        for item in tokens:
            token_model = {
            "token_number":item.token_number
            }
            token_list.append(token_model)

        resp = {
            "success": True,
            "code": 200,
            "message": "success GetTokensForRestaurant",
            "data": {
              "restaurant_id": restaurant_id,
              "tokens": token_list
            }
        }
        return resp

    def check_token_is_already_used(self, data):
        pass

    def add_contribution_points(self, contribution_type_value, user):
        print('contribution_type_value')
        print(contribution_type_value)
        contribution_type = ContributionType.objects.get(contribution_type_id=contribution_type_value)
        print(contribution_type)
        contribution = Contribution(
            contribution_type = contribution_type,
            user = user
            )
        pass