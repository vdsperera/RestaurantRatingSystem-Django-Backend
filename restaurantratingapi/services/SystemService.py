from django.utils.crypto import get_random_string
from .ValidationService import ValidationService
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
        try: 
            contribution.save()
        except IntegrityError as e:
            raise APIException(e)    
        pass

    def get_top_contributors(self, data):

        # from_date = data["from_date"]
        # to_date = data["to_date"]
        all = False
        try:
            from_date = data['fromdate'][0]
            to_date = data['todate'][0]
        except:
            all = True

        if(not ValidationService.isset(value=from_date) or not ValidationService.isset(value=to_date)):
            all = True

        if(not ValidationService.is_valid_date(value=from_date)):
            raise APIException("Invalid from date") 

        if(not ValidationService.is_valid_date(value=to_date)):
            raise APIException("Invalid to date") 

        if(all):
            contributions = Contribution.objects.raw("""
                SELECT contribution.contribution_id, contribution.user_id, SUM(contribution_type.allocated_points) as total_points
                FROM contribution
                INNER JOIN contribution_type
                ON contribution.contribution_type = contribution_type.contribution_type_id
                GROUP BY contribution.user_id
                ORDER BY total_points DESC
                """)
        else:            
            contributions = Contribution.objects.raw("""
                SELECT contribution.contribution_id, contribution.user_id, SUM(contribution_type.allocated_points) as total_points
                FROM contribution
                INNER JOIN contribution_type
                ON contribution.contribution_type = contribution_type.contribution_type_id
                WHERE contribution.created_on BETWEEN %s AND %s
                GROUP BY contribution.user_id
                ORDER BY total_points DESC
                """, [from_date, to_date])

        list = []

        for item in contributions:
            user = User.objects.get(id=item.user_id)
            model = {
              "user": user.username,
              "total_points": item.total_points
            }
            list.append(model)

        resp={
            "success": True,
            "code": 200,
            "message": "uccess GetContributors",
            "data": {
                "from_date": from_date if all != True else None,
                "to_date": to_date if all != True else None,
                "contributors": list
            }
        }

        return resp