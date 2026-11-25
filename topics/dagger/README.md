## 1. What is Dagger?

- https://docs.dagger.io/

### Overview

Dagger lets you write CI/CD pipelines as code in a real programming language (Go, Python, TypeScript and others) instead of tool-specific YAML. Each pipeline step runs in a container managed by the Dagger Engine, so the same pipeline runs identically on your laptop and on any CI runner — you can run and debug it locally before pushing.

Key ideas:

- **Dagger Engine** — a containerized runtime that executes pipeline steps as a graph of operations with built-in caching
- **Dagger CLI** — talks to the engine; `dagger call` runs functions from your own modules, `dagger core` calls the core API directly
- **Modules and functions** — reusable, typed pipeline code written with a Dagger SDK
- **Containers, Directories, Files** — immutable core types you chain together (`from`, `with-directory`, `with-exec`, ...)

Dagger is complementary to CI systems such as [GitHub Actions](../github-action/), [GitLab CI](../gitlabci/) and [Jenkins](../jenkins/): those trigger and schedule jobs, while Dagger defines what the job does in a portable way.

### Official Documentation

- https://docs.dagger.io/
- GitHub: https://github.com/dagger/dagger

## 2. Prerequisites

- A container runtime such as Docker, running locally (see the [`docker`](../docker/) topic)
- Basic familiarity with containers and CI/CD stages (build, test)
- Optional: Python, Go or TypeScript knowledge for writing your own modules

## 3. Installation

### How to install the Dagger CLI?

```bash
# macOS / Linux
curl -fsSL https://dl.dagger.io/dagger/install.sh | sh

# macOS via Homebrew
brew install dagger/tap/dagger

# Verify
dagger version
```

- Official install guide: https://docs.dagger.io/install/

## 4. Basics of Dagger

### Getting started with Dagger

- To get started visit [`basics/`](./basics/) — a runnable script that runs a small sample app's unit tests inside a container using the Dagger CLI.

### Dagger Hello World

```bash
# Run a command in a container and print its output
dagger core container from --address=alpine:latest \
  with-exec --args=echo,"Hello from Dagger" stdout
```

Test a local directory inside a container:

```bash
dagger core container \
  from --address=python:3.12-alpine \
  with-directory --path=/app --directory=./app \
  with-workdir --path=/app \
  with-exec --args=python,-m,unittest,-v \
  stdout
```

## 5. Beyond the Basics

### Writing a Dagger module

For anything beyond one-liners, put your pipeline in a module so it is versioned, typed and reusable:

```bash
dagger init --sdk=python --name=ci
dagger functions            # list the functions your module exposes
dagger call <function> ...  # run one
```

Follow the SDK guide for the module layout of your Dagger version: https://docs.dagger.io/

### Caching

The engine caches each step. Unchanged steps are skipped on re-runs, locally and (with a persistent engine or cache volume) in CI.

### Running Dagger in CI

Because the pipeline is just a `dagger call`, your CI config shrinks to "install the CLI, run the command". See the CI guides in the official docs for GitHub Actions, GitLab CI and others.

### Hands-On Examples

- See: [practice/](./practice/)

## 6. More

### Dagger Cheatsheet

```bash
dagger version                      # show CLI version
dagger core --help                  # explore the core API from the CLI
dagger init --sdk=python --name=ci  # create a new module
dagger functions                    # list functions in the current module
dagger call <function> --help       # show a function's arguments
dagger call <function>              # run a function
```

### Recommended Resources

- [Dagger Documentation](https://docs.dagger.io/)
- [Dagger GitHub](https://github.com/dagger/dagger)
- [Daggerverse (community modules)](https://daggerverse.dev/)
