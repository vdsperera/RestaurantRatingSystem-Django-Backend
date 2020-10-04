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
    
    queryset = Restaurant.objects.all().order_by('restaurant_id')
    serializer_class = RestaurantSerializer
    def create(self, request):
        data = request.data['data']['mdata']
        # print(data)
        #logger.info(request.data)
        rs = RestaurantService()
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
	    queryset = Restaurant.objects.all()
		#logger.info("ccccccvvvvvvv")
		
	    serializer = RestaurantSerializer(queryset, many=True, context={'request':request})
	    return Response(serializer.data)

# class RestaurantViewSet(APIView):

#     def post(self, request):
#         data = request.data['data']['mdata']
#         rs = RestaurantService()
#         print(rs.register_restaurant(data))
#         return Response({'status': 'successful'})

class RatingViewSet(viewsets.ViewSet):

    serializer_class = RestaurantSerializer

    def create(self, request):
        data = request.data['data']['mdata']
        rating_service = RatingService()
        qry = rating_service.add_rating(data)
        return Response(qry)
