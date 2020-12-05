from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.views import APIView
from .serializers import UserRoleSerializer
from .serializers import RestaurantSerializer
from .serializers import RatingSerializer
from .models import UserRole
from .models import Restaurant
from rest_framework.response import Response
import logging
from .services.RestaurantService import RestaurantService
from .services.RatingService import RatingService
from .services.DishService import DishService
from .services.SystemService import SystemService
from django.forms.models import model_to_dict
from django.http import JsonResponse
from django.core import serializers
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated

logger = logging.getLogger(__name__)
# logger.info("VDS")
# Create your views here.
class UserRoleViewSet(viewsets.ModelViewSet):
    queryset = UserRole.objects.all().order_by('role_name')
    serializer_class = UserRoleSerializer

class RestaurantViewSet(viewsets.ViewSet):
    
    # authentication_classes = (BasicAuthentication,)
    # permission_classes = (IsAuthenticated,)
    
    # queryset = Restaurant.objects.all().order_by('restaurant_id')
    # serializer_class = RestaurantSerializer
    def create(self, request):
        data = request.data['data']['mdata']
        # print(data)
        #logger.info(request.data)
        rs = RestaurantService()
        # qry = rs.register_restaurant(data)
        qry = rs.register_restaurant(data)
        # print(qry)
        # serializer = RestaurantSerializer(qry)
        # serialized_obj = serializers.serialize('python', [qry,], ensure_ascii=False)
        # print(serialized_obj)
        # return Response(serialized_obj)
        # return Response(RestaurantSerializer(instance=serialized_obj).data)
        # return JsonResponse(serializer, safe=False)
        # return Response({'status':'successful'})
        return Response(qry)

    def list(self, request):
        myDict = dict(self.request.query_params)
        # queryset = Restaurant.objects.all()
        #logger.info("ccccccvvvvvvv")
        # serializer = RestaurantSerializer(queryset, many=True, context={'request':request})
        # return Response(serializer.data)
        # return Response('get restaurant list')
        rs = RestaurantService()
       
        # not pre planned
        if 'dishid' in myDict:
            qry = rs.get_restaurant_list_for_dish(myDict['dishid'][0])
            return Response(qry)
            # return Response('restaurant list for a dish')
        # 

        qry = rs.get_restaurant_list(request)
        return Response(qry)
        

    def retrieve(self, request, rest_id=None):
        rs = RestaurantService()
        qry = rs.get_restaurant(rest_id)
        return Response(qry)

    def add_dishes(self, request):
        rs = RestaurantService()
        qry = rs.add_dishes_for_the_restaurant(request.data['data']['mdata'])
        return Response(qry)

    def edit_restaurant(self, request):
        rs = RestaurantService()
        data = request.data['data']['mdata']
        qry = rs.request_edit(data)
        return Response(qry)

# class RestaurantViewSet(APIView):

#     def post(self, request):
#         data = request.data['data']['mdata']
#         rs = RestaurantService()
#         print(rs.register_restaurant(data))
#         return Response({'status': 'successful'})

class RatingViewSet(viewsets.ViewSet):

    # serializer_class = RestaurantSerializer

    # POST /ratings
    def create(self, request):
        # return Response('add rating')
        data = request.data['data']['mdata']
        rating_service = RatingService()
        qry = rating_service.add_rating(data)
        return Response(qry)

    # POST /ratings/verify/[rating_id]
    def verify(self, request, rating_id=None):
        return Response('verify rating')

    # GET /ratings/list - get ratings details list for all restaurants(group by rest)(with average ratings) 
    # GET /ratings/list?restid=[restaurant_id] - get ratings list for the restaurant
    def list(self, request, pk=None):
        # return Response('list')
        rs = RatingService()
        myDict = dict(self.request.query_params)
        # print(myDict=={})
        if 'restid' in myDict:
            qry = rs.get_ratings_for_restaurant(myDict['restid'][0])
            # return Response('get ratings list for the restaurant')

        if 'dishid' in myDict:
            return Response('list for dishid')

        if myDict=={}:
            # return Response('get ratings list for all restaurants(group by rest)(with average ratings)')
            qry = rs.get_rating_list_for_all_restaurants(request)

        return Response(qry)


    # GET /ratings/dishes/list?dishid=[dish_id] - get dish ratings  list for all restaurants for specific dish
    # GET /ratings/dishes/list?restid=[rest_id] - get dish rating list for a restaurant
    def dish_list(self, request, pk=None):
        myDict = dict(self.request.query_params)
        rs = RatingService()
        # print(myDict=={})
        if 'dishid' in myDict:
            qry = rs.get_dish_rating_list_for_all_restaurant_for_the_dish(myDict['dishid'][0])
            # return Response('get dish ratings  list for all restaurants for specific dish')

        if 'restid' in myDict:
            qry = rs.get_dish_rating_list_for_the_restaurant(myDict['restid'][0])
            # return Response('get dish rating list for a restaurant')

        return Response(qry)
        # return Response('dish list')



    def retrieve(self, request, pk=None):
        myDict = dict(self.request.query_params)
        print(myDict['restid'][0])
        rs = RatingService()
        # return Response(qry)
        if 'dishid' in myDict:
            # print(self.suffix)
            return Response('retrieve for dish_id')

        if 'restid' in myDict:
            # return Response('retrieve for rest_id')
            qry = rs.get_ratings_for_restaurant(myDict['restid'][0])

        # if '' in myDict:
        #     return Response('')

        return Response(qry)


    def retrieve_for_rest_id(self, request, rest_id=None):
        return Response('retrieve for rest_id')


    def retrieve_for_dish_id(self, request, dish_id=None):
        # print('dish_id' in self.kwargs)
        return Response('retrieve for dish_id')

        return Response('dish rating list of all restaraunt for a specific dish')        
        # ratings/<int:dish_id>/
        # rs = RatingService()
        # qry = rs.get_ratings_for_dish(pk)
        # return Response(qry)

    def partial_update(self, request, pk=None):
        return Response('partial update rating')


class DishViewSet(viewsets.ViewSet):

    def list(self, request):
        ds = DishService()
        qry = ds.get_system_dish_list(request)
        return Response(qry)
        pass


class ContributionViewSet(viewsets.ViewSet):

    def list(self, request):
        # need to replace this with contribution service
        myDict = dict(self.request.query_params)
        # print(myDict)
        ss = SystemService()
        qry = ss.get_top_contributors(myDict)
        return Response(qry)       


class SystemViewSet(viewsets.ViewSet):

    def create(self, request):
        data = request.data['data']['mdata']
        ss = SystemService()
        qry = ss.generate_tokens_for_restaurant(data)
        return Response(qry)

    def list(self, request):
        myDict = dict(self.request.query_params)
        print(myDict)
        ss = SystemService()
        qry = ss.get_tokens_for_restaurant(myDict)
        return Response(qry)
