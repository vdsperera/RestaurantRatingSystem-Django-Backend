from django.test import TestCase
from rest_framework import status
from rest_framework.test import APITestCase

class RestaurantTest(APITestCase):

	def test_register_restaurant(self):
		url = 'restaurants/list'
		response = self.api_client.get(url, format='json')
		self.assertValidJSONResponse(resp)

	def test_claim_restaurant(self):
		pass

	def test_get_restaurant(self):
		pass

	def test_get_restaurant_list(self):
		pass

	def test_get_restaurant_list_for_dish(self):
		pass

	def test_add_dishes_for_the_restaurant(self):
		pass

	def test_request_edit(self):
		pass

	def test_approve_edit(self):
		pass

