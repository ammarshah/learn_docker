# Vidly

It's an app where you can see the list of movies' names and also add/remove them.

The Frontend (ReactJS) app communicates with the Backend (NodeJS) app via APIs.

The compose file consists of three services in order to run this project:

  1. web (Frontend)
  2. api (Backend)
  3. db (Database - MongoDB)

## Project Setup

To setup and run this project, you must have [Docker](https://www.docker.com/get-started/) installed in your system.

First verify Docker Engine and Docker Compose is installed properly by running:

```shell
$ docker version
# ...
# Server: Docker Engine - Community
#  Engine:
#   Version:          25.0.0
# ...

$ docker compose version
# Docker Compose version v2.24.1
```

Then clone the repository and run the project in a Docker container using:

```shell
$ git clone git@github.com:ammarshah/learn_docker.git
$ cd learn_docker/vidly
$ docker compose -f compose.dev.yml up
```

Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

You can see the Backend API on [http://localhost:3001/api](http://localhost:3001/api)

For example: [http://localhost:3001/api/movies](http://localhost:3001/api/movies)

## Development Environment

For development purposes, you can run the project in a [`watch`](https://docs.docker.com/compose/file-watch/) mode:

```shell
$ docker compose -f compose.dev.yml watch
```

To login to the container's shell:

```shell
$ docker exec -it <container-name> sh
```

Finally, to stop the container use:

```shell
$ docker compose -f compose.dev.yml down

# If you want Docker to automatically remove the containers, images and network use:
$ docker compose -f compose.dev.yml down --rmi local
```

## Production Deployment

a. Build the images using the following:

```shell
$ docker compose -f compose.prod.yml build
```

b. Tag the images with new build version:

```shell
$ docker tag ammarshah/vidly-web:latest ammarshah/vidly-web:1.0.0
$ docker tag ammarshah/vidly-api:latest ammarshah/vidly-api:1.0.0
```

c. Push the tags to your [Docker Hub](https://hub.docker.com) repository:

```shell
$ docker push ammarshah/vidly-web:1.0.0
$ docker push ammarshah/vidly-web:latest

$ docker push ammarshah/vidly-api:1.0.0
$ docker push ammarshah/vidly-api:latest
```

d. Commit and push the latest code to your GitHub repository:

```shell
$ git push origin master
```

e. Login to your production server via ssh and pull the latest code from GitHub repository:

```shell
$ git pull origin master
```

f. Finally, use `docker compose` command to run the required services:

```shell
$ docker compose -f compose.prod.yml up -d
```

Note: This will pull the latest (pre-built) image for each service, listed in `compose.prod.yml`, from the Docker Hub registry and run the containers.

The application is accessible at [http://your-server-ip](http://your-server-ip).
