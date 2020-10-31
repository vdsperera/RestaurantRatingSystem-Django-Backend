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
    path('restaurants/<int:rest_id>/', views.RestaurantViewSet.as_view({'get':'retrieve'}), name='RestaurantView'),

    # Ratings
    path('ratings/', views.RatingViewSet.as_view({'post': 'create'}), name='RatingView'),
    path('ratings/verify/<int:rating_id>/', views.RatingViewSet.as_view({'post':'verify'}), name='RatingView'),
    path('ratings', views.RatingViewSet.as_view({'get':'retrieve'}), name='RatingView'),
    # path('ratings/<int:rest_id>/', views.RatingViewSet.as_view('get':'retrieve'), name='RatingView')
    path('ratings/list', views.RatingViewSet.as_view({'get':'list'}), name='RatingView'),
    path('ratings/dishes', views.RatingViewSet.as_view({'get':'dish_list'}), name='RatingView'),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]

# POST  /api/restaurants
# PATCH /api/restaurants/[id]
# PUT   /api/restaurants/[id]
# GET   /api/restaurants/[id]
# GET   /api/RestaurantViewSet