from ..models import Dish

class DishService:

    def get_system_dish_list(self, data):

        dishes = Dish.objects.all()
        dish_list = []

        for item in dishes:
            dish = {
                "dish_id": item.dish_id,
                "dish_name": item.dish_name,
                "dish_status": item.status,
                "added_by": item.created_by.username         
            }
            dish_list.append(dish)

        resp={
            "success": True,
            "code": 200,
            "message": "success GetSystemDishList",
            "data": {
                "dishes": dish_list
            }
        }

        return resp
