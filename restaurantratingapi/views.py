from django.shortcuts import render
from rest_framework import viewsets
from .serializers import UserRoleSerializer
from .models import UserRole

# Create your views here.
class UserRoleViewSet(viewsets.ModelViewSet):
	queryset = UserRole.objects.all().order_by('role_name')
	serializer_class = UserRoleSerializer