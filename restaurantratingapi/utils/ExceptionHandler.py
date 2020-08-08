from rest_framework.views import exception_handler
from rest_framework.response import Response

def custom_exception_hander(exc, context):
	response = exception_handler(exc, context)

	if response is not  None:
		response.data['status_code'] = response.status_code

	# print(response.data)
	# resp = {
 #        "success": False,
 #        "code": response.status_code,
 #        "message": response.data['detail']
 #    }


	# return  Response(resp)

	return  response