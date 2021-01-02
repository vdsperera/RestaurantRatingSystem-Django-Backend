from enum import Enum

class RestaurantDishStatus(Enum):
	Rejected = 0
	Pending = 1
	Approved = 2

class SystemDishStatus(Enum):
	Rejected = 0
	Pending = 1
	Approved = 2