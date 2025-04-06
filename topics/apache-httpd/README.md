# Apache HTTP Server (httpd)

## 1. What is Apache HTTP Server?

### Overview

The Apache HTTP Server, commonly referred to as **Apache httpd**, is a free and open-source web server software developed and maintained by the Apache Software Foundation. It is one of the most widely used web servers in the world and plays a key role in the growth of the internet by supporting websites of all sizes and types.

Apache httpd supports a wide range of features including dynamic loading of modules, powerful URL rewriting, authentication mechanisms, and support for various programming languages through integration (e.g., PHP, Python, Perl). It can serve both static and dynamic content and is highly configurable and extensible.

Source: https://en.wikipedia.org/wiki/Apache_HTTP_Server

### Official Website of Apache HTTP Server

- https://httpd.apache.org/

### Official Documentation of Apache HTTP Server

- https://httpd.apache.org/docs/

### What you can do with Apache HTTP Server

- Host static websites and serve files over HTTP/S.
- Reverse proxy or load balance to backend services.
- Use it as a secure frontend to application servers.
- Integrate with scripting languages like PHP, Python, or Perl.
- Configure URL routing, authentication, access control, logging, and more.

---

## 2. Prerequisites

- Basic knowledge of web server technologies.
- A Unix/Linux, Windows, or macOS system.
- Command-line access with root/administrator privileges.

---

## 3. Installation

### How to Install Apache HTTP Server?

#### On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install apache2
```

#### On RHEL/CentOS/Rocky:

```bash
sudo dnf install httpd
```

#### On macOS (using Homebrew):

```bash
brew install httpd
```

### Start and Enable Apache:

```bash
# Start the service
sudo systemctl start apache2     # Ubuntu/Debian
sudo systemctl start httpd       # RHEL/CentOS

# Enable on boot
sudo systemctl enable apache2    # Ubuntu/Debian
sudo systemctl enable httpd      # RHEL/CentOS
```

### Verify Installation

- Open a web browser and navigate to: `http://localhost`
- You should see the **Apache2 Default Page** or **"It works!"** page.

---

## 4. Basics of Apache HTTP Server

### Get started with Apache httpd

- https://httpd.apache.org/docs/2.4/getting-started.html

### Apache HTTP Server Quick Start Guide

- Learn to configure the server using `httpd.conf`.
- Set up Virtual Hosts for multiple websites.
- Enable modules (e.g., `mod_rewrite`, `mod_ssl`, `mod_proxy`).
- Create a custom index page in `/var/www/html/`.

### Apache HTTP Server Hands-On

- See: [basic](./basic/)

---

## 5. More...

### Apache httpd Cheatsheet

- https://devhints.io/apache

### Recommended Books

- **Apache: The Definitive Guide** by Ben Laurie and Peter Laurie.
- **Pro Apache** by Peter Wainwright.
- **Apache Cookbook** by Rich Bowen and Ken Coar.
