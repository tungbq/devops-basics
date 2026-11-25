# Basics of Dagger

## Demo

Run `./dagger_test_demo.sh` to start a container from `python:3.12-alpine`, mount the tiny sample app in [`app/`](./app/) into it, and run its unit tests — all through the Dagger CLI's `dagger core` API, so no pipeline YAML and no Dagger module is needed to get started.

The script is a single chained call; each step returns a new immutable container and the last one (`stdout`) triggers execution:

```bash
dagger core container \
  from --address=python:3.12-alpine \
  with-directory --path=/app --directory=./app \
  with-workdir --path=/app \
  with-exec --args=python,-m,unittest,-v \
  stdout
```

### Requirements

- `docker` (or another container runtime supported by Dagger) running locally
- `dagger` CLI (see the [installation section](../README.md#3-installation) in the parent topic)

### Cleanup

Dagger keeps its engine in a container named `dagger-engine-*`. To remove it:

```bash
docker rm -f $(docker ps -aq --filter name=dagger-engine)
```
