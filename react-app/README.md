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
$ docker compose up
```

Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

## Development Mode

For development purposes, you can run the project in a [`watch`](https://docs.docker.com/compose/file-watch/) mode:

```shell
$ docker compose watch
```

To login to the container's shell:

```shell
$ docker exec -it react-app-server-1 sh
```

Finally, to stop the container use:

```shell
$ docker compose down

# If you want Docker to automatically remove the container, image and network use:
$ docker compose down --rmi local
```
