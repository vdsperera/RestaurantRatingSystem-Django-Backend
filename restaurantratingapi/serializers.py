from .models import UserRole
from rest_framework import serializers

class UserRoleSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = UserRole
		fields = ('role_id', 'role_name')