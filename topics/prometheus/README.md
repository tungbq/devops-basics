## 1. What is Prometheus?

- https://prometheus.io/docs/introduction/overview/#what-is-prometheus

### Overview

- Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud.

### Prometheus architecture

<img src="../../assets/images/prometheus/prometheus-architecture.png" width="700">

- (Image source provided by https://prometheus.io/docs/introduction/overview/#architecture)

### Official website documentation of Prometheus

- https://prometheus.io/docs/introduction/overview/

## 2. Prerequisites

- Linux, Helm, k8s

## 3. Installation

### How to install Prometheus?

- https://prometheus.io/docs/prometheus/latest/installation/

## 4. Basics of Prometheus

### Prometheus getting started

- https://prometheus.io/docs/prometheus/latest/getting_started/

### Prometheus Hello World

- Required knowledge in [helm](../../topics/helm/) | [k8s](../../topics/k8s/) first for better understanding. Because we will deploy our own Prometheus to K8s using Helm
- Run the demo scipt: `cd basic; ./prometheus-helloworld.sh`
- (Optional) Run the demo scipt and cleanup right after the demo: `cd basic; ./prometheus-helloworld.sh true`

## 5. Beyond the Basics

### Hands-On Example

- Check the [advanced/](./advanced/) directory for more Prometheus examples.

## 6. More...

### Prometheus cheatsheet

- https://promlabs.com/promql-cheat-sheet/

### Recommended Books

- N/A
