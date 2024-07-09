# Nginx demo with docker compose

- Prerequisites:
  - Docker + Docker compose installed
- This setup will include two services: one for NGINX and another for a simple web server (e.g., an HTTP server running in a Python container).
- Main files:

  - [nginx.conf](./nginx.conf): Contains basic NGINX configuration
  - [html](./html/): Contains HTML file for web server running with python
  - [docker-compose.yaml](./docker-compose.yaml): To deploy 2 separated containers for this demo (Nginx + HTTP web server)

- Run the hands on:

  ```bash
  cd devops-basics/topics/nginx/basic
  docker-compose up -d
  ```

- Now you'll have an NGINX server acting as a reverse proxy to another web server running in a separate Docker container.
- Visit: http://localhost:7080/ you could see:

  ![demo_nginx_basic_ok](./assets/demo_nginx_basic_ok.png)

  _NOTE_: You can change the localhost port from `7080` to any port works on your machine, and update the port definition in `docker-compose.yaml` as well.

- To cleanup resouce, run:

  ```bash
  cd devops-basics/topics/nginx/basic
  docker-compose down
  ```
