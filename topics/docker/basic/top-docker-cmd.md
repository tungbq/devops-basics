# Essential Docker Commands

Docker has rapidly become the de facto standard for containerizing applications. As a developer or system administrator, getting familiar with Docker is crucial for deploying modern, portable applications efficiently. While Docker has many advanced features and commands, there are some essential ones you'll find yourself using constantly. Let's go through the top Docker commands everyone should know.

# Table of Contents

1. [Installation](#installation)
2. [Docker General Commands](#docker-general-commands)
3. [Docker Registry](#docker-registry)
4. [Docker Images](#docker-images)
5. [Docker Containers](#docker-containers)
6. [Docker Cleanup](#docker-cleanup)
7. [What's next?](##whats-next)

## Installation

- To install Docker on your machine, follow this [**document**](https://docs.docker.com/engine/install/) (Supported various platforms)

## Docker general commands

1. **docker info**
   `docker info` Display system-wide information

2. **docker --help**
   `docker --help` Get help with Docker. Can also use –help on all subcommands

## Docker Registry

3. **docker login**  
   `docker login` is used to log in to a Docker registry.

   | Title     | Command                               | Description                                               |
   | --------- | ------------------------------------- | --------------------------------------------------------- |
   | Template  | `docker login <options>`              | Log in to a Docker registry with specified authentication |
   | Usecase 1 | `docker login`                        | Log in to the default Docker registry                     |
   | Usecase 2 | `docker login myregistry -u username` | Log in to a private registry with the specified username  |

## Docker Images

4. **docker build**  
    `docker build` is used to build custom Docker images from a Dockerfile.

   | Title     | Command                                      | Description                                                |
   | --------- | -------------------------------------------- | ---------------------------------------------------------- |
   | Template  | `docker build -t <your_image_name> <option>` | Build a Docker image from a Dockerfile with specified tag  |
   | Usecase 1 | `docker build -t MyImage .`                  | Build an image using a Dockerfile in the current directory |
   | Usecase 2 | `docker build -t MyImage -f demo/Dockerfile` | Build an image using a Dockerfile in the demo directory    |

5. **docker tag**  
   `docker tag` allows you to create a new tag for an existing Docker image.

   | Title     | Command                                        | Description                                                                |
   | --------- | ---------------------------------------------- | -------------------------------------------------------------------------- |
   | Template  | `docker tag <source_image> <target_image>`     | Create a new tag for an existing Docker image                              |
   | Usecase 1 | `docker tag myimage:latest myimage:v2`         | Create a new tag "v2" for the Docker image "myimage" with tag "latest"     |
   | Usecase 2 | `docker tag myimage:latest myregistry/myimage` | Tag the Docker image "myimage" with tag "latest" and push it to a registry |

6. **docker images**  
   The `docker images` command lists all Docker images pulled and built on your system. You'll use this frequently to view images before running containers or cleaning up.

   | Title     | Command                   | Description                                         |
   | --------- | ------------------------- | --------------------------------------------------- |
   | Template  | `docker images <options>` | List Docker images on the system                    |
   | Usecase 1 | `docker images`           | List all Docker images on the system                |
   | Usecase 2 | `docker images -a`        | List all Docker images, including intermediate ones |

7. **docker pull**  
   To download an image from a registry like Docker Hub, use `docker pull`. For example, `docker pull nginx` fetches the latest nginx image.

   | Title     | Command                              | Description                                   |
   | --------- | ------------------------------------ | --------------------------------------------- |
   | Template  | `docker pull <image_name>`           | Pull a Docker image from a registry           |
   | Usecase 1 | `docker pull nginx`                  | Pull the latest nginx image from Docker Hub   |
   | Usecase 2 | `docker pull myregistry/myimage:tag` | Pull a specific image from a private registry |

8. **docker push**  
   `docker push` is used to upload Docker images to a registry.

   | Title     | Command                              | Description                                                                 |
   | --------- | ------------------------------------ | --------------------------------------------------------------------------- |
   | Template  | `docker push <image_name>`           | Push a Docker image to a registry                                           |
   | Usecase 1 | `docker push myimage`                | Push the "myimage" image to the default registry                            |
   | Usecase 2 | `docker push myregistry/myimage:tag` | Push a specific tagged version of the "myimage" image to a private registry |

9. **docker rmi**  
   `docker rmi` removes one or more Docker images. Make sure there are no stopped containers based on an image before removing it.

   | Title     | Command                   | Description                                             |
   | --------- | ------------------------- | ------------------------------------------------------- |
   | Template  | `docker rmi <image_name>` | Remove a Docker image                                   |
   | Usecase 1 | `docker rmi myimage`      | Remove the Docker image named "myimage"                 |
   | Usecase 2 | `docker rmi myimage:tag`  | Remove a specific tagged version of the "myimage" image |

## Docker Container

10. **docker run**  
     `docker run` creates and starts a new container from an image. You can pass various options to configure the container's networking, set environment variables, map volumes, and more.

    | Title     | Command                                                                      | Description                                                               |
    | --------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
    | Template  | `docker run <options> <image>`                                               | Create and start a container from an image with specified options         |
    | Usecase 1 | `docker run -d --name mycontainer nginx`                                     | Run nginx image in detached mode with container name "mycontainer"        |
    | Usecase 2 | `docker run -p 8080:80 --name mycontainer nginx`                             | Run nginx image with port mapping from host 8080 to container 80          |
    | Usecase 3 | `docker run -e MYSQL_ROOT_PASSWORD=password -v /mydata:/var/lib/mysql mysql` | Run MySQL image with setting root password                                |
    | Usecase 4 | `docker run -v /mydata:/var/lib/mysql mysql`                                 | Run MySQL image and mounting a host directory to container                |
    | Usecase 5 | `docker run --network=host myimage`                                          | Run a container using the host network                                    |
    | Usecase 6 | `docker run --privileged myimage`                                            | Run a container with extended privileges using the Docker image "myimage" |

11. **docker ps**  
    Once you have containers running, you'll need `docker ps` to list them. The basic `docker ps` shows just running containers. Use `docker ps -a` to include stopped containers as well.

    | Title     | Command               | Description                                 |
    | --------- | --------------------- | ------------------------------------------- |
    | Template  | `docker ps <options>` | List Docker containers on the system        |
    | Usecase 1 | `docker ps`           | List running containers                     |
    | Usecase 2 | `docker ps -a`        | List all containers, including stopped ones |

12. **docker stop/start/restart**  
    These commands allow you to stop, start, or restart one or more running containers. You reference containers by name or ID.

    | Title     | Command                                      | Description                                   |
    | --------- | -------------------------------------------- | --------------------------------------------- |
    | Template  | `docker stop/start/restart <container_name>` | Stop/start/restart a Docker container         |
    | Usecase 1 | `docker stop mycontainer`                    | Stop a running container named "mycontainer"  |
    | Usecase 2 | `docker restart mycontainer`                 | Restart a container named "mycontainer"       |
    | Usecase 3 | `docker start mycontainer`                   | Start a stopped container named "mycontainer" |

13. **docker rm**  
    Once you've stopped a container, `docker rm` removes it entirely from your system. Use `docker rm -f` to force-remove running containers.

    | Title     | Command                           | Description                                          |
    | --------- | --------------------------------- | ---------------------------------------------------- |
    | Template  | `docker rm <options> <container>` | Remove a Docker container                            |
    | Usecase 1 | `docker rm mycontainer`           | Remove a stopped container named "mycontainer"       |
    | Usecase 2 | `docker rm -f mycontainer`        | Force-remove a running container named "mycontainer" |

14. **docker logs**  
    When a containerized application is not behaving correctly, `docker logs` retrieves the logs from a specified container to help troubleshoot.

    | Title     | Command                              | Description                                        |
    | --------- | ------------------------------------ | -------------------------------------------------- |
    | Template  | `docker logs <container>`            | Retrieve logs from a Docker container              |
    | Usecase 1 | `docker logs mycontainer`            | Retrieve logs from a container named "mycontainer" |
    | Usecase 2 | `docker logs --tail 100 mycontainer` | Retrieve last 100 lines of logs from "mycontainer" |

15. **docker exec**  
    `docker exec` allows you to run a new command inside an already-running container. For example, starting a Bash shell with `docker exec -it <container> /bin/bash`.

    | Title     | Command                                       | Description                                      |
    | --------- | --------------------------------------------- | ------------------------------------------------ |
    | Template  | `docker exec <options> <container> <command>` | Run a command inside a running Docker container  |
    | Usecase 1 | `docker exec -it mycontainer /bin/bash`       | Start an interactive Bash shell in "mycontainer" |
    | Usecase 2 | `docker exec mycontainer ls -l /app`          | List files in directory "/app" in "mycontainer"  |

16. **docker cp**  
    `docker cp` allows you to copy files and directories between a container and the local filesystem.

    | Title     | Command                                                             | Description                                                                             |
    | --------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
    | Template  | `docker cp <container_id_or_name>:<source_path> <destination_path>` | Copy files or directories from a container to the local filesystem                      |
    | Usecase 1 | `docker cp mycontainer:/app/logs/log.txt ./local_dir/`              | Copy the file "log.txt" from the container "mycontainer" to a local directory           |
    | Usecase 2 | `docker cp ./local_file.txt mycontainer:/app/data/`                 | Copy the file "local_file.txt" from the local filesystem to the container "mycontainer" |

## Docker cleanup

17. **docker system prune**  
    `docker system prune` allows you to clean up unused data in your Docker environment.

    | Title     | Command                         | Description                                                               |
    | --------- | ------------------------------- | ------------------------------------------------------------------------- |
    | Template  | `docker system prune <options>` | Clean up unused data in your Docker environment with specified options    |
    | Usecase 1 | `docker system prune`           | Remove all stopped containers, dangling images, and unused networks       |
    | Usecase 2 | `docker system prune -a`        | Remove all stopped containers, all unused images, and all unused networks |

## What's next?

- For the full list of docker commands, visit: https://docs.docker.com/reference/cli/docker/
