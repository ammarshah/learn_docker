# Getting Started with React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app) and then added [Docker](https://www.docker.com) for learning purposes.

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
$ cd learn_docker/react-app
$ docker compose -f compose.dev.yml up
```

Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

## Development Environment

For development purposes, you can run the project in a [`watch`](https://docs.docker.com/compose/file-watch/) mode:

```shell
$ docker compose -f compose.dev.yml watch
```

To login to the container's shell:

```shell
$ docker exec -it react-app-server-1 sh
```

Finally, to stop the container use:

```shell
$ docker compose -f compose.dev.yml down

# If you want Docker to automatically remove the container, image and network use:
$ docker compose -f compose.dev.yml down --rmi local
```

## Production Deployment

For production deployment, you have two options to choose from if you're doing it manually (without using any CI/CD tool):

### 1. Using [Docker Hub](https://hub.docker.com)

a. Build an image using the following:

```shell
$ docker compose -f compose.prod.yml build
```

b. Tag the image with your repository name and build version:

`docker tag react-app-server:production [namespace]/[repository-name]:[tagname]`

```shell
$ docker tag react-app-server:production ammarshah/react-app:1.0.0

$ docker tag ammarshah/react-app:1.0.0 ammarshah/react-app:latest
```

c. Push the tags to your [Docker Hub](https://hub.docker.com) repository:

```shell
$ docker push ammarshah/react-app:1.0.0

$ docker push ammarshah/react-app:latest
```

d. Finally, login to your production server via ssh and run the recent version of your production build/image on the server:

```shell
$ docker run -d -p 80:8080 --name react-app-server-1 ammarshah/react-app:1.0.0
```

Note: The drawback with this option is that you can't get the benefit of the single `docker compose` command, meaning you will have to repeat more steps on every deployment but it will be quicker since the images are pre-built and ready to run.

### 2. Using [GitHub](https://www.github.com)

a. Push the latest code to your GitHub repository

```shell
$ git push origin master
```

b. Login to your production server via ssh and pull the latest code from GitHub repository

```shell
$ git pull origin master
```

c. Finally, use the single `docker compose` command to run a container

```shell
$ docker compose -f compose.prod.yml up -d
```

Note: The drawback with this option is that you can't get the benefit of pre-built images, so it will be slower but fewer steps to follow on every deployment.

The application is accessible at [http://your-server-ip](http://your-server-ip) using either option.
