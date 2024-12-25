# IIS Webserver Basics

This section covers the fundamental concepts and steps to get started with IIS Webserver. Whether you're new to IIS or looking for a refresher, you'll find the basics here.

---

## 1. Getting Started with IIS

### Launch the IIS Manager

1. Open the **Run** dialog by pressing `Win + R` and type `inetmgr`.
2. Press **Enter** to open the IIS Manager.

### Add a Website in IIS

1. In IIS Manager:
   - Right-click on **Sites** in the left-hand navigation pane.
   - Select **Add Website**.
2. Fill in the required details:
   - **Site Name**: Choose a unique name for your site.
   - **Physical Path**: Set the directory where your website files are stored.
   - **Binding**: Specify the protocol, IP address, and port (e.g., HTTP on port 80).
3. Click **OK** to add the website.

### Test the Website

1. Open a browser and navigate to the hostname or IP address you configured (e.g., `http://localhost`).
2. Verify that your website is loading successfully.

---

## 2. Configuring IIS

### Enable Directory Browsing

1. Select your site in IIS Manager.
2. Double-click **Directory Browsing** under the IIS section.
3. Click **Enable** in the Actions pane.

### Configure Application Pools

- **What is an Application Pool?**  
  An application pool isolates one or more applications from others running on the same server.
  
1. In IIS Manager, click **Application Pools** in the left-hand navigation pane.
2. Right-click on an application pool and select **Add Application Pool**.
3. Provide a name and select the appropriate .NET Framework version (if applicable).
4. Click **OK**.

---

## 3. Deploying a Simple HTML Website

1. Create an HTML file named `index.html` with the following content:

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Welcome to IIS</title>
   </head>
   <body>
       <h1>Hello, IIS is running your site!</h1>
   </body>
   </html>
