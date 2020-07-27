from django.utils.crypto import get_random_string

class SystemService:

    def __init__(self):
    	self.data = []
    	
    @staticmethod
    def generate_restaurant_code():
    	return get_random_string(length=20)