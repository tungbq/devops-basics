## Apache HTTP Server Hands-On

Hands-on guide for Apache HTTP Server using Docker

### Run Apache HTTP Server in Docker

You can quickly get Apache up and running using the official Docker image.

---

### 4.1 Run a Simple Apache Container

```bash
docker run -d --name apache-server -p 8080:80 httpd:latest
# Note: Replace 8080 with the PORT works on your own machine.
```

- Access it at: [http://localhost:8080](http://localhost:8080)
- This will show the default Apache welcome page.

---

### 4.2 Serve Custom Content

1. **Create your own `index.html`:**

```bash
mkdir apache-content
echo "<h1>Hello from Apache in Docker!</h1>" > apache-content/index.html
```

2. **Run Apache with your custom HTML:**

```bash
docker run -d \
  --name apache-custom \
  -p 8081:80 \
  -v $(pwd)/apache-content:/usr/local/apache2/htdocs/ \
  httpd:latest
```

- Visit: [http://localhost:8081](http://localhost:8081)
- You'll see your custom message.

---

### 4.3 Use a Custom Apache Configuration (Optional)

1. **Create your custom Apache config file (e.g., `my-httpd.conf`)**:

```apache
ServerName localhost

LoadModule mpm_event_module modules/mod_mpm_event.so
LoadModule dir_module modules/mod_dir.so

Listen 80
DocumentRoot "/usr/local/apache2/htdocs"
<Directory "/usr/local/apache2/htdocs">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>

DirectoryIndex index.html
```

2. **Mount the custom config file into the container**:

```bash
docker run -d \
  --name apache-with-conf \
  -p 8082:80 \
  -v $(pwd)/apache-content:/usr/local/apache2/htdocs/ \
  -v $(pwd)/my-httpd.conf:/usr/local/apache2/conf/httpd.conf \
  httpd:latest
```

- Check at [http://localhost:8082](http://localhost:8082)

---

### 4.4 Clean Up

```bash
docker rm -f apache-server apache-custom apache-with-conf
```

---

### 4.5 Source & Reference

- [Official Docker Hub Image for httpd](https://hub.docker.com/_/httpd)
- [Apache Documentation](https://httpd.apache.org/docs/)
