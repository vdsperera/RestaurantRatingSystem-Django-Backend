from .ValidationService import ValidationService
from .SystemService import SystemService
from ..enums.RestaurantEnums import ClaimStatus
from ..models import Restaurant
from django.contrib.auth.models import User

class RestaurantService:

    def __init__(self):
        self.data = []

    def register_restaurant(self, data):
        rest_name = data['name'] #restaurant name #required
        rest_address = data['address'] #restaurant address
        rest_pnumber = data['phone_number'] #restaurant phone number
        rest_added_by = data['user'] #restaurant is added by #required
        rest_owner = data['owner'] #owner of the restaurant
        rest_longitude = data['longitude'] #restaurant GEO location-longitude #required
        rest_latitude = data['latitude'] #restaurant GEO location-latitude #required
        rest_code = 'djhfd4343'

        if(not ValidationService.isset(value=rest_name)):
            raise Exception("Restaurant name is empty")

        if(not ValidationService.isset(value=rest_added_by)):
            raise Exception("User is empty")

        if(not ValidationService.isset(value=rest_longitude)):
            raise Exception("Logitude is empty")    

        if(not ValidationService.isset(value=rest_latitude)):
            raise Exception("Latitude is empty")    

        user = User.objects.get(username='vidumini')   

        rest = Restaurant(
            name=rest_name,
            address=rest_address,
            phone_number=rest_pnumber,
            created_by=user,
            claimed=ClaimStatus.Unclaimed.value,
            claimed_by=rest_owner,
            longitude=rest_longitude,
            latitude=rest_latitude,
            code=SystemService.generate_restaurant_code())      
         
        rest.save()
        # rest = Restaurant.objects.get(restaurant_id=1)
        # print(rest)

        return data['name']  	
        
    def de_register_restaurant():
        pass    
        
    def get_restaurant():
        pass

    def get_restaurant_list():
        pass

    def request_edit():
        pass

    def approve_edit():
        pass

    def claim_restaurant():
        pass