# Backstage Practice

Use these exercises after completing the runnable example in [`../basics/`](../basics/README.md).

## Exercise 1: Register another service

### Goal

Practice creating and registering a new `Component` entity in the Backstage Software Catalog.

### Tasks

1. Create a new YAML file named `second-service.yaml`.
2. Define a `Component` entity with:
   - a unique `metadata.name`
   - a short description
   - `spec.type` set to `service`
   - `spec.lifecycle` set to `experimental`
   - `spec.owner` set to `guests`
3. Add the file to the existing `catalog.locations` list in `app-config.yaml`.
4. Start Backstage with `yarn start`.
5. Confirm that the new component appears in the Software Catalog.

### Expected result

The catalog should show both `devops-basics-sample-service` and the new service you created.

## Exercise 2: Change component metadata

### Goal

See how changes to catalog metadata are reflected in Backstage.

### Tasks

1. Add at least two tags to `second-service.yaml`.
2. Change its description.
3. Restart Backstage if necessary.
4. Open the component in the Software Catalog and verify the updated metadata.

### Challenge

Read the Backstage catalog entity descriptor documentation and add one more supported metadata or specification field to your component.

Documentation:

- https://backstage.io/docs/features/software-catalog/descriptor-format/
