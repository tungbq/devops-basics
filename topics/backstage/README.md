# Backstage

## 1. What is Backstage?

- https://backstage.io/

### Overview

Backstage is an open-source framework for building developer portals. It provides a central place for developers to discover software, understand ownership, use software templates, browse technical documentation, and integrate engineering tools through plugins.

One of its core features is the Software Catalog, which keeps metadata about services, websites, libraries, APIs, systems, resources, users, and groups in a consistent format.

### Official documentation

- https://backstage.io/docs/

## 2. Prerequisites

For a local standalone installation, review the official Backstage prerequisites before starting:

- A Unix-based environment such as Linux, macOS, or Windows Subsystem for Linux (WSL)
- Node.js Active LTS. Backstage currently recommends Node.js 22 or 24
- Yarn and Corepack
- Git
- Docker
- At least 6 GB of memory and 20 GB of free disk space for the standalone demo environment

See the official installation guide for the complete and most up-to-date requirements:

- https://backstage.io/docs/getting-started/

## 3. Installation

Create a local Backstage application with the official scaffolding command:

```bash
npx @backstage/create-app@latest
```

Enter a name for the application when prompted, for example:

```text
my-backstage-app
```

Then start the application:

```bash
cd my-backstage-app
yarn start
```

When the application is ready, open:

```text
http://localhost:3000
```

## 4. Basics of Backstage

Backstage organizes software metadata through its Software Catalog. Catalog entities are usually defined in YAML files, and the recommended filename for an entity descriptor is `catalog-info.yaml`.

A basic component contains fields such as:

- `apiVersion`
- `kind`
- `metadata`
- `spec`
- component type
- lifecycle
- owner

Try the runnable example in [`basics/`](./basics/README.md) to create a local Backstage application and register a sample service in the Software Catalog.

Useful documentation:

- https://backstage.io/docs/features/software-catalog/
- https://backstage.io/docs/features/software-catalog/descriptor-format/

## 5. Beyond the Basics

After becoming familiar with the Software Catalog, explore other Backstage capabilities:

- Software Templates for creating components from reusable templates
- TechDocs for documentation-as-code
- Plugins for integrating engineering tools into the developer portal
- Authentication and authorization
- Deployment with Docker or Kubernetes

Useful documentation:

- https://backstage.io/docs/features/software-templates/
- https://backstage.io/docs/features/techdocs/
- https://backstage.io/plugins/
- https://backstage.io/docs/deployment/

## 6. More

### Practice

- Continue with the exercises in [`practice/`](./practice/README.md).

### Learning resources

- Backstage documentation: https://backstage.io/docs/
- Backstage GitHub repository: https://github.com/backstage/backstage
- Backstage plugin directory: https://backstage.io/plugins/
