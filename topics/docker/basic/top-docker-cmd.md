## Introduction 👋

- Docker has rapidly become the de facto standard for containerizing applications. As a developer or DevOps Engineer/SysAdmin, getting familiar with Docker is crucial for deploying modern, portable applications efficiently.
- While Docker boasts numerous advanced features and commands, there are certain essential ones you'll find yourself using consistently on a daily basis.
- In this post, we will go through the top **17+** Docker commands and their use cases everyone should know.

## Installation 🔨

- To install Docker on your machine, follow this [**document**](https://docs.docker.com/engine/install/) (Supported various platforms)
- To get hands-on experience and understand Docker better, you could visit this [**repository**](https://github.com/tungbq/devops-basics) (topics/docker)

## Table of Contents 🔖

- [Docker General](#docker-general-commands) (info | help)
- [Docker Registry](#docker-registry) (login)
- [Docker Images](#docker-images) (build | tag | images | pull | push | rmi )
- [Docker Containers](#docker-container) (run | ps | stop/start/restart | rm | logs | exec | cp)
- [Docker Cleanup](#docker-cleanup) (system prune)
- [What's next?](#whats-next)

## Docker general commands

### 1. docker info

`docker info` displays system-wide information

### 2. docker --help

`docker --help` gets help with Docker. Can also use --help on all subcommands

## Docker Registry

### 3. docker login

- `docker login` is used to log in to a Docker registry.
- Syntax: `docker login <options> <registry>`
- Use cases:

| ID  | Command                               | Description                                              |
| --- | ------------------------------------- | -------------------------------------------------------- |
| 1   | `docker login`                        | Log in to the default Docker registry                    |
| 2   | `docker login myRegistry -u username` | Log in to a private registry with the specified username |

## Docker Images

### 4. docker build

- `docker build` is used to build custom Docker images from a Dockerfile.
- Syntax:`docker build -t <your_image_name> <options> <dockerfile_path>`
- Use cases:

| ID  | Command                                      | Description                                                |
| --- | -------------------------------------------- | ---------------------------------------------------------- |
| 1   | `docker build -t myImage .`                  | Build an image using a Dockerfile in the current directory |
| 2   | `docker build -t myImage:v0.1.0 .`           | Build a Docker image from a Dockerfile with specified tag  |
| 3   | `docker build -t myImage -f demo/Dockerfile` | Build an image using a Dockerfile in the demo directory    |

### 5. docker tag

- `docker tag` allows you to create a new tag for an existing Docker image.
- Syntax: `docker tag <source_image> <target_image>`
- Use cases:

| ID  | Command                                              | Description                                                                     |
| --- | ---------------------------------------------------- | ------------------------------------------------------------------------------- |
| 1   | `docker tag myImage:latest myImage:v2`               | Create a new tag "v2" for the Docker image "myImage" with tag "latest"          |
| 2   | `docker tag myImage:latest myRegistry/myImage`       | Tag the Docker image "myImage" with tag "latest" to a registry image tag latest |
| 3   | `docker tag myImage:latest myRegistry/myImage:1.0.0` | Tag the Docker image "myImage" with tag "latest" to a registry image tag 1.0.0  |

### 6. docker images

- The `docker images` command lists all Docker images pulled and built on your system. You'll use this frequently to view images before running containers or cleaning up.
- Syntax: `docker images <options>`
- Use cases:

| ID  | Command            | Description                                         |
| --- | ------------------ | --------------------------------------------------- |
| 1   | `docker images`    | List all Docker images on the system                |
| 2   | `docker images -a` | List all Docker images, including intermediate ones |

### 7. docker pull

- To download an image from a registry like Docker Hub, use `docker pull`. For example, `docker pull nginx` fetches the latest nginx image.
- Syntax: `docker pull <image_name>`
- Use cases:

| ID  | Command                              | Description                                            |
| --- | ------------------------------------ | ------------------------------------------------------ |
| 1   | `docker pull nginx`                  | Pull the latest nginx image from Docker Hub            |
| 2   | `docker pull nginx:latest`           | Pull the latest nginx image from Docker Hub explicitly |
| 3   | `docker pull myRegistry/myImage:tag` | Pull a specific image from a private registry          |

### 8. docker push

- `docker push` is used to upload Docker images to a registry.
- Syntax: `docker push <image_name>`
- Use cases:

| ID  | Command                              | Description                                                                 |
| --- | ------------------------------------ | --------------------------------------------------------------------------- |
| 1   | `docker push myImage`                | Push the "myImage" image to the default registry                            |
| 2   | `docker push myRegistry/myImage:tag` | Push a specific tagged version of the "myImage" image to a private registry |

### 9. docker rmi

- `docker rmi` removes one or more Docker images. Make sure there are no stopped containers based on an image before removing it.
- Syntax: `docker rmi <image_name>`
- Use cases:

| ID  | Command                  | Description                                             |
| --- | ------------------------ | ------------------------------------------------------- |
| 1   | `docker rmi myImage`     | Remove the Docker image named "myImage"                 |
| 2   | `docker rmi myImage:tag` | Remove a specific tagged version of the "myImage" image |

## Docker Container

### 10. docker run

- `docker run` creates and starts a new container from an image. You can pass various options to configure the container's networking, set environment variables, map volumes, and more.
- Syntax: `docker run <options> <image>`
- Use cases:

| ID  | Command                                                                      | Description                                                               |
| --- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| 1   | `docker run -d --name mycontainer nginx`                                     | Run nginx image in detached mode with container name "mycontainer"        |
| 2   | `docker run -p 8080:80 --name mycontainer nginx`                             | Run nginx image with port mapping from host 8080 to container 80          |
| 3   | `docker run -e MYSQL_ROOT_PASSWORD=password -v /mydata:/var/lib/mysql mysql` | Run MySQL image with setting root password                                |
| 4   | `docker run -v /mydata:/var/lib/mysql mysql`                                 | Run MySQL image and mounting a host directory to container                |
| 5   | `docker run --network=host myImage`                                          | Run a container using the host network                                    |
| 6   | `docker run --privileged myImage`                                            | Run a container with extended privileges using the Docker image "myImage" |

### 11. docker ps

- Once you have containers running, you'll need `docker ps` to list them. The basic `docker ps` shows just running containers. Use `docker ps -a` to include stopped containers as well.
- Syntax: `docker ps <options>`
- Use cases:

| ID  | Command        | Description                                 |
| --- | -------------- | ------------------------------------------- |
| 1   | `docker ps`    | List running containers                     |
| 2   | `docker ps -a` | List all containers, including stopped ones |

### 12. docker stop/start/restart

- These commands allow you to stop, start, or restart one or more running containers. You reference containers by name or ID.
- Syntax: `docker stop/start/restart <container_name>`
- Use cases:

| ID  | Command                      | Description                                   |
| --- | ---------------------------- | --------------------------------------------- |
| 1   | `docker stop mycontainer`    | Stop a running container named "mycontainer"  |
| 2   | `docker restart mycontainer` | Restart a container named "mycontainer"       |
| 3   | `docker start mycontainer`   | Start a stopped container named "mycontainer" |

### 13. docker rm

- Once you've stopped a container, `docker rm` removes it entirely from your system. Use `docker rm -f` to force-remove running containers.
- Syntax: `docker rm <options> <container>`
- Use cases:

| ID  | Command                    | Description                                          |
| --- | -------------------------- | ---------------------------------------------------- |
| 1   | `docker rm mycontainer`    | Remove a stopped container named "mycontainer"       |
| 2   | `docker rm -f mycontainer` | Force-remove a running container named "mycontainer" |

### 14. docker logs

- When a containerized application is not behaving correctly, `docker logs` retrieves the logs from a specified container to help troubleshoot.
- Syntax: `docker logs <options> <container>`
- Use cases:

| ID  | Command                              | Description                                        |
| --- | ------------------------------------ | -------------------------------------------------- |
| 1   | `docker logs mycontainer`            | Retrieve logs from a container named "mycontainer" |
| 2   | `docker logs --tail 100 mycontainer` | Retrieve last 100 lines of logs from "mycontainer" |

### 15. docker exec

- `docker exec` allows you to run a new command inside an already-running container. For example, starting a Bash shell with `docker exec -it <container> /bin/bash`.
- Syntax: `docker exec <options> <container> <command>`
- Use cases:

| ID  | Command                                 | Description                                      |
| --- | --------------------------------------- | ------------------------------------------------ |
| 1   | `docker exec -it mycontainer /bin/bash` | Start an interactive Bash shell in "mycontainer" |
| 2   | `docker exec mycontainer ls -l /app`    | List files in directory "/app" in "mycontainer"  |

### 16. docker cp

- `docker cp` allows you to copy files and directories between a container and the local filesystem.
- Syntax: `docker cp <container_id_or_name>:<source_path> <destination_path>`
- Use cases:

| ID  | Command                                                | Description                                                                             |
| --- | ------------------------------------------------------ | --------------------------------------------------------------------------------------- |
| 1   | `docker cp mycontainer:/app/logs/log.txt ./local_dir/` | Copy the file "log.txt" from the container "mycontainer" to a local directory           |
| 2   | `docker cp ./local_file.txt mycontainer:/app/data/`    | Copy the file "local_file.txt" from the local filesystem to the container "mycontainer" |

## Docker cleanup

### 17. docker system prune

- `docker system prune` allows you to clean up unused data in your Docker environment.
- Syntax: `docker system prune <options>`
- Use cases:

| ID  | Command                  | Description                                                               |
| --- | ------------------------ | ------------------------------------------------------------------------- |
| 1   | `docker system prune`    | Remove all stopped containers, dangling images, and unused networks       |
| 2   | `docker system prune -a` | Remove all stopped containers, all unused images, and all unused networks |

## What's next?

- For the full list of docker commands, visit: https://docs.docker.com/reference/cli/docker/
- You could the most comprehensive and up-to-date content on this topic, please visit this [**repo**] (https://github.com/tungbq/devops-basics/blob/main/topics/docker/basic/top-docker-cmd.md) ⭐️.

Which Docker command do you find yourself using the most? Let us know in the comments below. Your feedback and suggestions are highly appreciated. Thank you, and happy coding! 💖
