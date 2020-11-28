from enum import Enum

class ContributionTypes(Enum):
	CustomerRegistration = 0
	AddRestaurant = 1
	AddUnverifiedRestaurantRating = 2
	AddVerifiedRestaurantRatingg = 3
	AddUnverifiedDishRating = 4
	AddVerifiedDishRating = 5
	AddDishToRestaurant = 6
	AddDishToSystem = 7


