#!/bin/bash

# Collect static files
#echo "Collect static files"
#python manage.py collectstatic --noinput
Apply database migrations
#echo "Apply database migrations"
python manage.py makemigrations
#
python manage.py migrate

# Start server
echo "Starting server"

python manage.py flush --no-input
python manage.py collectstatic --no-input
gunicorn --timeout=30 --workers=2 --bind 0.0.0.0:8000 first_project.wsgi:application --reload
exec "$@"
#python manage.py runserver 0.0.0.0:8000
