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