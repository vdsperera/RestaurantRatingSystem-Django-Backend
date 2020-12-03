import re

class ValidationService:

    def __init__(self):
        self.data = []

    @staticmethod
    def isset(value):
        if(value != ''):
            if(value != None):
                return True
            else:
                return False
        else:
            return False

    @staticmethod
    def is_geo_coordinate(value, type):
        status = False
        if type == 'lo':
            return True if (value <= 90 and value >= -90) else False
        if type == 'la':
            return True if (value <= 180 and value >= -180) else False

    @staticmethod
    def is_phone_number(value):
        if(re.match(r"^\+?1?\d{9,15}$", value)):
            return True
        else:
            False

    @staticmethod
    def is_valid_token(value):
        return True

    @staticmethod
    def is_valid_rating(value):
        if(not isinstance(value, int)):
            return False
        if(5<value):
            return False
        return True

    @staticmethod
    def is_valid_date(value):
        return True















