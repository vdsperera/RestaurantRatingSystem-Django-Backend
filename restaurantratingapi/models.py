from django.db import models
from django.contrib.auth.models import User
from django.contrib.gis.geos import Point
from django.core.validators import RegexValidator
from phonenumber_field.modelfields import PhoneNumberField

class UserRole(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_name = models.CharField(max_length=20)

    class Meta:
        managed = True
        db_table = 'user_role'

class UserLevel(models.Model):
    level_number = models.PositiveSmallIntegerField(primary_key=True)
    points_level = models.PositiveIntegerField()
    allocated_comfirmation_points = models.PositiveIntegerField()
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='created_by', blank=True, null=True, related_name='user_level_reated_by')
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='updated_by', blank=True, null=True, related_name='user_level_updated_by')

    class Meta:
    	managed = True
    	db_table = 'user_level'

class CustomUser(models.Model):
	user = models.OneToOneField(User, models.CASCADE, primary_key=True)
	account_status = models.PositiveSmallIntegerField()
	level_number = models.ForeignKey(UserLevel, on_delete=models.PROTECT, db_column='level_number')
	role_id = models.ForeignKey(UserRole, on_delete=models.PROTECT, db_column='role_id')
	email_code = models.CharField(max_length=255)
	email_verified = models.PositiveSmallIntegerField()	
	birthday = models.DateField()
	gender = models.PositiveSmallIntegerField()
	address = models.CharField(max_length=255)
	phone_number = models.CharField(max_length=50)
	profile_picture = models.ImageField(null=True)
	updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
	updated_by = models.ForeignKey(User, on_delete=models.CASCADE, db_column='updated_by', blank=True, null=True, related_name='custom_user_updated_by')

	class Meta:
		managed = True
		db_table = 'custom_user'

class Restaurant(models.Model):

    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")

    restaurant_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    longitude = models.FloatField(null=True)
    latitude = models.FloatField(null=True)
    phone_number = models.CharField(validators=[phone_regex], max_length=50, blank=True, null=True)
    #phone_number = PhoneNumberField(unique=True, blank=True, null=True)
    claimed = models.PositiveIntegerField()
    claimed_by = models.ForeignKey(User, models.DO_NOTHING, db_column='claimed_by', blank=True, null=True)
    code = models.CharField(max_length=50)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='created_by',null=True, related_name='restaurant_created_by')
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='updated_by', blank=True, null=True, related_name='restaurant_updated_by')

    class Meta:
        managed = True
        db_table = 'restaurant'
        constraints = [
            models.UniqueConstraint(fields=['name'], name='unique_restaurant_name')
        ]

class Meal(models.Model):
    meal_id = models.AutoField(primary_key=True)
    meal_name = models.CharField(max_length=50)

    class Meta:
        managed = True
        db_table = 'meal'

class RestaurantMeal(models.Model):
    meal = models.OneToOneField(Meal, on_delete=models.PROTECT)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='restaurant_meal_created_by')
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='restaurant_meal_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'restaurant_meal'
        #unique_together = (('meal', 'restaurant'),)
        constraints = [
            models.UniqueConstraint(fields=['meal', 'restaurant'], name='unique_restaurant_meal')
        ]

class Dish(models.Model):
    dish_id = models.AutoField(primary_key=True)
    dish_name = models.CharField(max_length=50)
    status = models.PositiveIntegerField()
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='dish_created_by')
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='dish_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'dish'

class RestaurantDish(models.Model):
    dish = models.ForeignKey('dish', on_delete=models.PROTECT, db_column='dish_id', related_name='restaurant_dish_dish')
    restaurant = models.ForeignKey('restaurant', on_delete=models.CASCADE, db_column='restaurant_id', related_name='restaurant_dish_restaurant')
    added_by = models.ForeignKey(User, on_delete=models.SET_NULL, db_column='added_by', related_name='restaurant_dish_added_by', null=True)
    status = models.PositiveIntegerField()
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='restaurant_dish_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'restaurant_dish'
        #unique_together = (('dish_id', 'restaurant_id', 'user_id'),) 
        constraints = [
            models.UniqueConstraint(fields=['dish_id', 'restaurant_id', 'added_by'], name='unique_restaurant_dish')
        ]

class Token(models.Model):
    token_number = models.CharField(primary_key=True, max_length=10)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, db_column='restaurant_id', related_name='token_restaurant')
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='token_created_by')

    class Meta:
        managed = True
        db_table = 'token'

class EditHistory(models.Model):
    history_id = models.AutoField(primary_key=True)
    current_value = models.CharField(max_length=255)
    requested_value = models.CharField(max_length=255)
    status = models.PositiveIntegerField()
    confirmed_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='confirmed_by', related_name='edit_history_confirmed_by')
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        managed = True
        db_table='edit_history'   

class EditComponent(models.Model):
    component_id = models.SmallAutoField(primary_key=True)
    component_name = models.CharField(max_length=255)
    confirmation_point_level = models.PositiveIntegerField()

    class Meta:
        managed = True
        db_table = 'edit_component'        

class UserEditHistoryComponent(models.Model):
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='user_id',related_name='user_edit_history_component_user')
    history = models.ForeignKey(EditHistory, on_delete=models.CASCADE, db_column='history_id', related_name='user_edit_history_component_history')
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE, db_column='restaurant_id', related_name='user_edit_history_component_restaurant')
    component = models.ForeignKey(EditComponent, on_delete=models.CASCADE, db_column='component_id', related_name='user_edit_history_component_component')
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'user_edit_history_component'
        #unique_together = (('user', 'history', 'restaurant', 'component'),)
        constraints = [
            models.UniqueConstraint(fields=['user_id', 'history_id', 'restaurant_id', 'component_id'], name='unique_user_edit_history_component')
        ]

class UserEditHistoryConfirmation(models.Model):

    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='user_id', related_name='user_edit_history_confirmation_user')
    history = models.ForeignKey(EditHistory, on_delete=models.DO_NOTHING, db_column='history_id', related_name='user_edit_history_confirmation_history')
    confirmation_points = models.IntegerField()
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'user_edit_history_confirmation'
        #unique_together = (('user_id', 'history_id'),)
        constraints = [
            models.UniqueConstraint(fields=['user_id', 'history_id'], name='unique_user_edit_history_confirmation')
        ]

class ContributionType(models.Model):
    contribution_type_id = models.AutoField(primary_key=True)
    contribution_name = models.CharField(max_length=50)
    allocated_points = models.PositiveIntegerField()
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='contribution_type_created_by')
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='contribution_type_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'contribution_type'

class Contribution(models.Model):
    contribution_id = models.AutoField(primary_key=True)
    contribution_type = models.ForeignKey(ContributionType, on_delete=models.DO_NOTHING, db_column='contribution_type', related_name='contribution_contribution_type')
    user = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id', related_name='contribution_user')
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'contribution'

class Rating(models.Model):
   rating_id = models.BigAutoField(primary_key=True)
   dish_rating = models.PositiveIntegerField(blank=True, null=True)
   price_rating = models.PositiveIntegerField(blank=True, null=True)
   service_rating = models.PositiveIntegerField(blank=True, null=True)
   verified = models.PositiveIntegerField()
   created_on = models.DateTimeField(auto_now_add=True)
   updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)

   class Meta:
       managed = True
       db_table = 'rating'

class AddedRating(models.Model):
    rating = models.OneToOneField(Rating, on_delete=models.CASCADE, db_column='rating_id', related_name='added_rating_rating', primary_key=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, db_column='restaurant_id', related_name='added_rating_restaurant')
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='user_id', related_name='added_rating_user')
    token_number = models.ForeignKey(Token, on_delete=models.DO_NOTHING, db_column='token_number', related_name='added_rating_token', blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'added_rating'
        #unique_together = (('rating', 'restaurant', 'user'),)
        # constraints = [
        #     models.UniqueConstraint(fields=['rating', 'restaurant', 'user'], name='unique_added_rating')
        # ]

class AddedDishRating(models.Model):
    rating = models.OneToOneField(Rating, on_delete=models.CASCADE, db_column='rating_id', related_name='added_dish_rating_rating', primary_key=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, db_column='restaurant_id', related_name='added_dish_rating_restaurant')
    dish = models.ForeignKey(Dish, on_delete=models.DO_NOTHING, db_column='dish_id', related_name='added_dish_rating_dish')
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='user_id', related_name='added_dish_rating_user')
    token_number = models.ForeignKey(Token, on_delete=models.DO_NOTHING, db_column='token_number', related_name='added_dish_rating_token', blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    updated_on = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'added_dish_rating'

class Review(models.Model):
    rating = models.OneToOneField(Rating, on_delete=models.DO_NOTHING, db_column='rating_id', related_name='review_rating', primary_key=True)
    message = models.TextField(blank=True, null=True)
    attachment = models.ImageField(blank=True, null=True)
    upvote_count = models.PositiveIntegerField()
    report_count = models.PositiveIntegerField(db_column='report count')  # Field renamed to remove unsuitable characters.
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='review_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'review'

class Reply(models.Model):
    reply_id = models.AutoField(primary_key=True)
    rating = models.ForeignKey(Rating, on_delete=models.CASCADE, db_column='rating_id', related_name='reply_rating')
    message = models.TextField()
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='reply_created_by')
    updated_on = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='reply_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'reply'

class ReportingType(models.Model):
    reporting_type_id = models.AutoField(primary_key=True)
    reporting_type_name = models.CharField(max_length=50)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='report_type_created_by')
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='report_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'reporting_type'

class Reporting(models.Model):
    reporting_id = models.AutoField(primary_key=True)
    reporter = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='reporter', related_name='reporting_type_reporter')
    reporting_type = models.ForeignKey(ReportingType, on_delete=models.DO_NOTHING, db_column='reporting_type', related_name='reporting_reporting_type')
    message = models.TextField(blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True, blank=True, null=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='reporting_type_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'reporting'

class UserReporting(models.Model):
    reporting = models.OneToOneField(Reporting, on_delete=models.CASCADE, db_column='reporting_id', related_name='user_reporting_reporting',primary_key=True)
    reporte = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='reporte_id', related_name='user_reporting_reporte')

    class Meta:
        managed = True
        db_table = 'user_reporting'


class RestaurantReporting(models.Model):
    reporting = models.OneToOneField(Reporting, on_delete=models.CASCADE, db_column='reporting_id', related_name='restaurant_reporting_reporting',primary_key=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, db_column='restaurant_id', related_name='restaurant_reporting_reporte')

    class Meta:
        managed = True
        db_table = 'restaurant_reporting'


class RestaurantComponentReporting(models.Model):
    reporting = models.OneToOneField(Reporting, on_delete=models.CASCADE, db_column='reporting_id', related_name='resraurant_component_reporting_reporting',primary_key=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, db_column='restaurant_id', related_name='restaurant_component_reporting_reporte')
    component = models.ForeignKey(EditComponent, on_delete=models.DO_NOTHING, db_column='component_id', related_name='restaurant_component_reporting_component')

    class Meta:
        managed = True
        db_table = 'restaurant_component_reporting'


class ReviewReporting(models.Model):
    reporting = models.OneToOneField(Reporting, on_delete=models.CASCADE, db_column='reporting_id', related_name='review_reporting_reporting',primary_key=True)
    rating = models.ForeignKey(Rating, on_delete=models.DO_NOTHING, db_column='rating_id', related_name='review_reporting_rating')

    class Meta:
        managed = True
        db_table = 'review_reporting'


class ReviewReplyReporting(models.Model):
    reporting = models.OneToOneField(Reporting, on_delete=models.DO_NOTHING, db_column='reporting_id', related_name='review_reply_reporting_reporting',primary_key=True)
    reply = models.ForeignKey(Reply, on_delete=models.DO_NOTHING, db_column='reply_id', related_name='review_reply_reporting_reply')

    class Meta:
        managed = True
        db_table = 'review_reply_reporting' 

class WarningLevel(models.Model):
    warning_level = models.AutoField(primary_key=True)
    warning_level_name = models.CharField(max_length=50)
    allocated_points = models.PositiveIntegerField()
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='warning_level_created_by')
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='warning_level_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'warning_level'

class Warning(models.Model):
    warning_id = models.AutoField(primary_key=True)
    warning_level = models.ForeignKey(WarningLevel, on_delete=models.DO_NOTHING, db_column='warning_level', related_name='warning_warning_level')
    message = models.TextField()
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='created_by', related_name='warning_created_by')
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='updated_by', related_name='warning_updated_by', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'warning'           

class CheckIn(models.Model):
    check_in_id = models.AutoField(primary_key=True)
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'check_in'

class CustomerCheckIn(models.Model):
    check_in = models.OneToOneField(CheckIn, on_delete=models.DO_NOTHING, db_column='check_in_id', related_name='customer_check_in_check_in', primary_key=True)
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='user_id', related_name='customer_check_in_user_id')
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, db_column='restaurant_id', related_name='customer_check_in_restaurant')

    class Meta:
        managed = True
        db_table = 'customer_check_in'
        #unique_together = (('check_in', 'user', 'restaurant'),)         