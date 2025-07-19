# Apache Tomcat Basics

This section covers the fundamental concepts and steps to get started with Apache Tomcat. Learn how to set up, configure, and deploy web applications.

---

## 1. Getting Started with Apache Tomcat

### Starting the Server

1. Open the terminal and navigate to the `bin` directory of your Tomcat installation.
2. Run the startup script:
   - **Windows**: `startup.bat`
   - **Linux/Mac**: `./startup.sh`

### Stopping the Server

1. Navigate to the `bin` directory.
2. Run the shutdown script:
   - **Windows**: `shutdown.bat`
   - **Linux/Mac**: `./shutdown.sh`

---

## 2. Configuring Apache Tomcat

### Change the Default Port

1. Open the `server.xml` file located in the `conf` directory.
2. Locate the `<Connector>` element and change the `port` attribute:

```xml
  <Connector port="8080" protocol="HTTP/1.1"
             connectionTimeout="20000"
             redirectPort="8443" />
```

---

## 3. Deploying a Sample Application

- Deploy a Pre-Built `.war` File
- Download a sample `.war` file
  - Download the sample application Sample Web Application at https://tomcat.apache.org/tomcat-10.1-doc/appdev/sample/
- Deploy to Tomcat
  - Copy the `.war` file into the webapps directory of your Tomcat installation.
  - Access the Application: Open a browser and navigate to http://localhost:8080/sample.
