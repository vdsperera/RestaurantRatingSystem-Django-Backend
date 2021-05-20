# RestaurantRatingSystem-Django-Angular-

Installing the Back-end

* For the backend, the needed database backups, postman collections are also stored in the backend code folder

* I recommand to use DBeaver as the database administration tool
	* You can change the database settings like database name, user, password in "/home/vidumini/Activities/Projects/BIT-FInal/RestaurantRatingSystem-Django-Backend-develop/restaurantratingsystem/settings.py" file
	* If you use default settings then you should set the database name as "rrs2", name as "root", password as "vdsforeverr", host as "127.0.0.1" and port as "3306"

* I used Linux environemnt for my development and so that some further instructions may be related with Linux environment. But this may not be issue because things are not hugely different.
	*I recommand to use Python 3.6 or upper version

* Postman collections are not mandatory and it is for checking API end points with Postman
	* You can use this to check some endpoints which are not connected to the frontend interfaces

* Before you install the backend You should create python virtual environment and for that you can follow below instructions(Here I use venv to create the virtual environment)
	* Install python3.6-venv by using below command
		* sudo apt-get install python3.6-venv
	* create virtual environement with venv by using below command
		* python3.6 -m venv py_env

* Required frameworks, libraries for the backend are included in requirement.txt file
	* You can install the backend with these libraries and framework by using below command
		* python3.6 -m pip install -r requirements.txt
	* Possible issues may be occured under linux and so if any following installation may fix them

* Then you can run the backend using below command
	* source run.sh

* I recommand to do another things before You interact with the API.
	* When try to interact with the API there may be another possible issue like Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column" and You can fixed it by execute the following command in mysql cosole(sudo mysql -u root -p)
		* 'SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));'

