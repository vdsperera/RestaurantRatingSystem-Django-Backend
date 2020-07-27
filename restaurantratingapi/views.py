from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.views import APIView
from .serializers import UserRoleSerializer
from .serializers import RestaurantSerializer
from .models import UserRole
from .models import Restaurant
from rest_framework.response import Response
import logging
from .services.RestaurantService import RestaurantService

logger = logging.getLogger(__name__)
# logger.info("VDS")
# Create your views here.
class UserRoleViewSet(viewsets.ModelViewSet):
	queryset = UserRole.objects.all().order_by('role_name')
	serializer_class = UserRoleSerializer

class RestaurantViewSet(viewsets.ViewSet):
	queryset = Restaurant.objects.all().order_by('restaurant_id')
	serializer_class = RestaurantSerializer
	def create(self, request):
		data = request.data['data']['mdata']
		# print(data)
		#logger.info(request.data)
		rs = RestaurantService()
		print(rs.register_restaurant(data))
		return Response({'status':'successful'})

	def list(self, request):
		queryset = Restaurant.objects.all()
		#logger.info("ccccccvvvvvvv")
		
		serializer = RestaurantSerializer(queryset, many=True)
		return Response(serializer.data)

# class RestaurantViewSet(APIView):

#     def post(self, request):
#         data = request.data['data']['mdata']
#         rs = RestaurantService()
#         print(rs.register_restaurant(data))
#         return Response({'status': 'successful'})
