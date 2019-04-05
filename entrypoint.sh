#!/bin/bash

# Collect static files
#echo "Collect static files"
#python manage.py collectstatic --noinput
python3 manage.py collectstatic --no-input
# Apply database migrations
echo "Apply database migrations"
python manage.py migrate

# Start server
echo "Starting server"
gunicorn --timeout=30 --workers=2 --bind 0.0.0.0:8000 first_project.wsgi:application
#python manage.py runserver 0.0.0.0:8000
