from enum import Enum

class ContributionTypes(Enum):
	CustomerRegistration = 1
	AddRestaurant = 2
	AddUnverifiedRestaurantRating = 3
	AddVerifiedRestaurantRating = 4
	AddUnverifiedDishRating = 5
	AddVerifiedDishRating = 6
	AddDishToRestaurant = 7
	AddDishToSystem = 8


