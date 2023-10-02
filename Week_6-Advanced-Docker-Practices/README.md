# Advanced Docker Practices

In this task, we will take a closer look at certain components of Docker such as: optimizing Docker images, Implementing Docker Compose for local development, and looking at Docker networks. If you don't have [Docker](https://docs.docker.com/engine/install/ubuntu/), [Docker Compose](https://docs.docker.com/compose/install/linux/) installed, you need to install!

<h3>Roadmap:</h3>

- [Optimizing Docker images](#task1) 
- [Implementing Docker Compose for local development](#task2)
- [Looking at Docker networks](#task3)

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

# <a name="task3">Looking at Docker networks</a>

### Different Types of Docker Networks:

Bridge Network:

- Default Network: When you create a Docker container without specifying a network, it's attached to the bridge network by default.
- Isolation: Containers on the bridge network can communicate with each other using container names, but they are isolated from the host and external networks.

Host Network:

- No Network Isolation: Containers on the host network share the host's network stack, making them part of the host network.
- Performance: Provides better performance as it bypasses Docker's network virtualization.

Overlay Network:

- Multi-Host Communication: Designed for containers running on multiple hosts in a swarm cluster.
- Overlay Driver: Utilizes overlay network driver to enable communication between containers across different hosts.


### Differences and Use Cases:

Bridge Network: 
- Suitable for applications where containers on the same host need to communicate and have internet access, but you want to isolate them from the host and other containers on different hosts.
- Use Cases: Suitable for most applications where containers need to communicate with each other within the same host.

Host Network:
- Useful for applications that require maximum network performance and direct access to the host's network stack. It sacrifices isolation for performance.
- Use Cases: Useful when you want containers to directly access the host's network stack or when you need maximum network performance.

Overlay Network: 
- Designed for container orchestration platforms like Docker Swarm or Kubernetes, enabling containers to communicate across multiple hosts in a cluster.
- Use Cases: Ideal for orchestrating containers in a distributed environment, such as Docker Swarm or Kubernetes, where containers need to communicate across multiple hosts.

### Demonstrating Different Docker Networking Types:

Creating a simple multi-container setup and demonstrating different Docker networking types involves setting up multiple containers and configuring them to use different networking options provided by Docker. In this example, I'll demonstrate the following Docker networking types:

- Bridge Network
- Host Network
- Overlay Network (for multi-host communication)

We'll use Docker Compose to define and manage the multi-container setup. Ensure you have Docker and Docker Compose installed on your system before proceeding.

As an example, I can cite my [Docker Compose file](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/blob/main/Week_6-Advanced-Docker-Practices/docker-compose.yml), which was prepared by the task earlier, in it I use the bridge network type.

- bridge: A bridge network (default) that allows containers on the same network to communicate.

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

To view the operation of another type of network, it is enough to change the name of one network to the name of another network, for example, host:
```
networks:
  public.app:
    driver: host
```
host: A host network that uses the host's network stack, allowing containers to directly access the host's network interfaces.
host_network: хост-мережа, яка використовує мережевий стек хоста, дозволяючи контейнерам отримувати прямий доступ до мережевих інтерфейсів хоста.
