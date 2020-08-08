from .models import UserRole
from .models import Restaurant
from rest_framework import serializers
from django.contrib.auth.models import User
from .serializers import *

class UserRoleSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = UserRole
		fields = ['role_id', 'role_name']

class RestaurantSerializer(serializers.ModelSerializer):
	# created_by = UserSerializer(many=True, read_only=True)
	class Meta:
		model = Restaurant
		fields = ['restaurant_id', 'name', 'address', 'longitude','latitude', 'phone_number', 'code','claimed', 'claimed_by', 'created_by']

class UserSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = User
		fields = ['id', 'username']