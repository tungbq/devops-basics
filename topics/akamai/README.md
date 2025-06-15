## Akamai

### 1. What is Akamai?

**Overview**
Akamai is one of the world’s largest content delivery networks (CDNs), providing secure and high-performance services to accelerate and protect applications, APIs, and websites.
It acts as an edge platform to deliver content closer to users, reduce latency, and mitigate traffic spikes and DDoS attacks.

> See: [https://www.akamai.com/products](https://www.akamai.com/products)

**Akamai Diagram**
Akamai edge delivery architecture: TBD

**Official Website of Akamai**
[https://www.akamai.com/](https://www.akamai.com/)

**Official Documentation**
[https://techdocs.akamai.com/](https://techdocs.akamai.com/)

### 2. Prerequisites

To start working with Akamai services:

- A registered Akamai account (with access to Control Center)
- Basic knowledge of HTTP, DNS, and CDN concepts
- (Optional) Familiarity with your web server or cloud platform
- For automation: Akamai API client or CLI installed

### 3. Akamai Basics

**Getting Started with Akamai**
Start here: [https://techdocs.akamai.com/home](https://techdocs.akamai.com/home)

**Key Concepts:**

- **Edge Servers**: Akamai's distributed servers that cache content closer to users
- **Property**: A configuration to control how your site behaves on the Akamai edge
  - Property Manager: https://techdocs.akamai.com/property-mgr/docs/welcome-prop-manager
- **EdgeWorkers**: Akamai’s serverless compute at the edge
- **Content Purging**: Clearing stale content from edge cache

### 4. Common Use Cases & Hands-On

**Simple CDN Configuration**
Use Akamai Control Center to create a property and set up edge delivery for your static site or web app.

**Use Case: Route by Path**
Route requests like `/app1`, `/app2` to different origins (e.g., Azure Front Door, HTTPD server).

**EdgeWorkers Hello World ⭐**
Run a basic JavaScript function at the edge with EdgeWorkers.
See: `akamai/edgeworkers/helloworld` (TBD)

### 5. Advanced Topics

**Integrate with Azure / Multi-CDN Setup**

- Use Akamai in front of Azure Front Door
- Geo-routing and failover between multiple origins
  See examples: `akamai/azure-integration` (TBD)

**Security Features**

- Web Application Firewall (WAF)
- Bot Manager
- DDoS Protection (Kona Site Defender)

### 6. More...

**Akamai Developer Resources**

- https://community.akamai.com/customers/s/?language=en_US

**Free Akamai Trial**
TBD

**Recommended Books**
N/A
