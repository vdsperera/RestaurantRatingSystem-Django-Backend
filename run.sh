readonly sourceFile="./py_env/bin/activate"
readonly password='vdsforever'
echo $password | sudo -S service mysql start
source ${sourceFile}
python manage.py runserver
