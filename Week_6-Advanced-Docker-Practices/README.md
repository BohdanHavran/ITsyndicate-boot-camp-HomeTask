# Advanced Docker Practices

In this task, we will take a closer look at certain components of Docker such as: optimizing Docker images, Implementing Docker Compose for local development, and looking at Docker networks. If you don't have [Docker](https://docs.docker.com/engine/install/ubuntu/), [Docker Compose](https://docs.docker.com/compose/install/linux/) installed, you need to install!

<h3>Roadmap:</h3>

- [Optimizing Docker images](#task1) 
- [Implementing Docker Compose for local development](#task2) 

# <a name="task1">Optimizing Docker images</a>

The result of optimizing the docker image was that the number of layers was reduced, which leads to faster assembly of the docker image, and it was also possible to reduce the size of the image to 100 MB for better mobility

Dockerfile:
```
FROM python:3.11-alpine

WORKDIR /app

RUN apk add --no-cache bash

COPY ./ ./

RUN adduser -D -u 1001 appuser && \
    pip install --no-cache-dir -r requirements.txt && \
    chown -R appuser:appuser /app

USER appuser

CMD ["sh", "-c", "./script.sh"]

```

# <a name="task2">Implementing Docker Compose for local development</a>

### How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_6-Advanced-Docker-Practices
```
In order to run this project, you need to enter the following commands:
```
docker-compose --env-file .env up -d
```
If you need to remove a project:
```
docker-compose --env-file .env down
```

With this Docker Compose, you will bring up a Django application, a Postgres database, and an Adminer to administer Postgres. Postgres will communicate with Django and Adminer using a private network, and Django and Adminer will have a public network to communicate with the user and a private network to communicate with Postgres. Volume is also present so that the database does not lose data after a reboot

<b><i>If you need to change certain data that is defined by variables, you need to go to the [.env](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/blob/main/Week_6-Advanced-Docker-Practices/.env) file and change whatever you need</i></b>


Docker Copmose file:
```
version: '3.4'

services:
  django:
    image: django-docker:1
    build:
      context: django_docker/
      dockerfile: Dockerfile
    environment:
      - POSTGRES_DB
      - POSTGRES_USER
      - POSTGRES_PASSWORD
      - DB_IP
      - DJANGO_ALLOWED_HOSTS
    ports:
      - 80:8000
    restart: always
    networks:
      - private.app
      - public.app
    depends_on:
      - db

  db:
    image: postgres
    restart: always
    environment:
      - POSTGRES_DB
      - POSTGRES_USER
      - POSTGRES_PASSWORD
    volumes:
      - PGDATA:/var/lib/postgresql/data
    networks:
      - private.app
    
  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
    volumes:
      - PGADATA:/var/lib/pgadmin
    networks:
      - private.app
      - public.app

networks:
  private.app:
    driver: bridge
    internal: true
  public.app:
    driver: bridge

volumes:
  PGDATA:
  PGADATA:
```
