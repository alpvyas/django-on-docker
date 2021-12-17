#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
  echo "Waiting for postgres..."

  while ! nc -z $SQL_HOST $SQL_PORT; do
    sleep 0.1
  done

  echo "PostgreSQL started"
fi

# #comment these two lines in to run on every container start or re-start
# python manage.py flush --no-input
# python manage.py migrate

#the above two commands can be run manually after the containers spin up:
# docker-compose exec web python manage.py flush --no-input
# docker-compose exec web python manage.py migrate

exec "$@"