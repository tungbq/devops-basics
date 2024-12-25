# Apache Tomcat

## 1. What is Apache Tomcat?

### Overview

Apache Tomcat (called "Tomcat" for short) is a free and open-source implementation of the Jakarta Servlet, Jakarta Expression Language, and WebSocket technologies. It provides a "pure Java" HTTP web server environment in which Java code can also run. Thus it is a Java web application server, although not a full JEE application server.
Tomcat is developed and maintained by an open community of developers under the auspices of the Apache Software Foundation, released under the Apache License 2.0 license.

Source: https://en.wikipedia.org/wiki/Apache_Tomcat

### Official Website of Apache Tomcat

- https://tomcat.apache.org/

### Official Documentation of Apache Tomcat

- https://tomcat.apache.org/tomcat-10.1-doc/

### What you can do with Apache Tomcat

- Host Java-based web applications.
- Implement and run Java Servlet and JSP technologies.
- Lightweight and highly customizable deployment platform.
- See details at: https://tomcat.apache.org/tomcat-10.1-doc/introduction.html

---

## 2. Prerequisites

- Basic knowledge of Java and web server technologies.
- Java Development Kit (JDK) installed on your system.

---

## 3. Installation

### How to Install Apache Tomcat?

1. **Download Apache Tomcat**:

   - Visit the official [Apache Tomcat Downloads](https://tomcat.apache.org/download-10.cgi) page.
   - Choose the version that matches your needs (e.g., Tomcat 10.1).

2. **Install Java**:

   - Ensure JDK is installed on your system. Apache Tomcat requires Java to run.
   - [Install JDK Guide](https://docs.oracle.com/en/java/javase/17/install/overview-jdk-installation.html)

3. **Extract and Configure Tomcat**:

   - Extract the downloaded archive to a desired directory.
   - Set the `CATALINA_HOME` environment variable to the Tomcat installation path.

4. **Start Tomcat**:

   - Navigate to the `bin` directory of your Tomcat installation.
   - Run `startup.bat` (Windows) or `./startup.sh` (Linux/Mac).

5. **Verify Installation**:
   - Open a browser and go to `http://localhost:8080`. You should see the Tomcat welcome page.

---

## 4. Basics of Apache Tomcat

### Get started with Apache Tomcat

- https://tomcat.apache.org/tomcat-10.1-doc/setup.html

### Apache Tomcat quick start guide

- Set up and deploy your first servlet or JSP application:
  - [Getting Started Guide](https://tomcat.apache.org/tomcat-10.1-doc/appdev/index.html)

### Apache Tomcat Hands-On

- See: [basic](./basic/)

---

## 5. More...

### Apache Tomcat Cheatsheet

- https://www.javacodegeeks.com/starting-with-apache-tomcat-cheatsheet.html

### Recommended Books

- **Tomcat: The Definitive Guide** by Jason Brittain.
- **Professional Apache Tomcat 8** by Vivek Chopra, et al.
