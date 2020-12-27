readonly sourceFile="./py_env/bin/activate"
readonly password='vdsforever'
readonly passwordm='vdsforeverr'
echo $password | sudo -S service mysql start
# echo $passwordm | mysql -u root -p
# SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
# exit
source ${sourceFile}
python manage.py runserver
