from enum import Enum

class ClaimStatus(Enum):
    Unclaimed = 0
    Pending = 1
    Claimed = 2


class RestaurantComponents(Enum):
	RestaurantName = 1
	RestaurantPhoneNumber = 2
	RestaurantWebsite = 3
	RestaurantEmail = 4
	RestaurantAddress = 5
	RestaurantLocation = 6