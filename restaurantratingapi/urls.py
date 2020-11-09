# myapi/urls.pyfrom django.urls import include, path
from django.urls import include, path
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(r'roles', views.UserRoleViewSet)
# router.register(r'restaurants', views.RestaurantViewSet, basename='RestaurantView')
# router.register(r'ratings', views.RatingViewSet, basename='RatingView')

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('', include(router.urls)),
    # Restaurants

    # GET /restaurants/[restaurant_id]
    path('restaurants/<int:rest_id>/', views.RestaurantViewSet.as_view({'get':'retrieve'}), name='RestaurantView'),

    # GET /restaurants/list
    path('restaurants/list', views.RestaurantViewSet.as_view({'get':'list'}), name='RestaurantView'),

    # not pre planned
    # GET /restaurants/list
    path('restaurants/list', views.RestaurantViewSet.as_view({'get':'list'}), name='RestaurantView'),
    # 

    # Ratings

    # POST /ratings
    path('ratings/', views.RatingViewSet.as_view({'post': 'create'}), name='RatingView'),

    # POST /ratings/verify/[rating_id]
    path('ratings/verify/<int:rating_id>/', views.RatingViewSet.as_view({'post':'verify'}), name='RatingView'),

    # GET /ratings/list - get ratings details list for all restaurants(group by rest)(with average ratings) 
    # GET /ratings/list?restid=[restaurant_id] - get ratings list for the restaurant
    path('ratings/list', views.RatingViewSet.as_view({'get':'list'}), name='RatingView'),

    # GET /ratings/dishes/list?dishid=[dish_id] - get dish ratings  list for all restaurants for specific dish
    # GET /ratings/dishes/list?restid=[rest_id] - get dish rating list for a restaurant
    path('ratings/dishes/list', views.RatingViewSet.as_view({'get':'dish_list'}), name='RatingView'),

    # 
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]

# POST  /api/restaurants
# PATCH /api/restaurants/[id]
# PUT   /api/restaurants/[id]
# GET   /api/restaurants/[id]
# GET   /api/RestaurantViewSet