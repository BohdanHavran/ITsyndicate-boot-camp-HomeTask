#!/bin/bash

python manage.py migrate
python manage.py collectstatic

gunicorn --bind 0.0.0.0:8000 --workers 3 mysite.wsgi
