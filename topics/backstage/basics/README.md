# Backstage Hello World

This example creates a local Backstage application and registers a sample service in the Software Catalog.

## Prerequisites

Make sure the prerequisites from the [Backstage topic README](../README.md#2-prerequisites) are installed.

## 1. Create a Backstage application

Run:

```bash
npx @backstage/create-app@latest
```

When prompted for an application name, use:

```text
my-backstage-app
```

The command creates a new `my-backstage-app` directory and installs the required dependencies.

## 2. Add the sample catalog entity

Copy the [`catalog-info.yaml`](./catalog-info.yaml) file from this directory into the root of the generated Backstage application and rename the copy to:

```text
sample-service.yaml
```

The generated application should now contain:

```text
my-backstage-app/
├── app-config.yaml
├── sample-service.yaml
├── package.json
└── packages/
```

## 3. Register the sample service

Open `my-backstage-app/app-config.yaml`.

Find the existing `catalog.locations` section and append the following location:

```yaml
catalog:
  locations:
    - type: file
      target: ../../examples/entities.yaml

    # Keep the other generated locations and add this one.
    - type: file
      target: ../../sample-service.yaml
      rules:
        - allow: [Component]
```

Do not create a second `catalog:` key if one already exists. Add the new `file` entry to the existing `catalog.locations` list.

Backstage resolves local file locations relative to the backend process, which normally runs from `packages/backend`. Therefore `../../sample-service.yaml` points to the file in the application root.

## 4. Start Backstage

From the generated application directory, run:

```bash
cd my-backstage-app
yarn start
```

When the frontend finishes starting, open:

```text
http://localhost:3000
```

## 5. Verify the service

Open the Software Catalog and search for:

```text
devops-basics-sample-service
```

The component should appear with:

- Type: `service`
- Lifecycle: `experimental`
- Owner: `guests`

You have now registered a custom service in the Backstage Software Catalog.

## Cleanup

Stop the local Backstage process with `Ctrl+C`.

If the application was created only for this example, you can remove the generated `my-backstage-app` directory afterward.
