#!/bin/bash

# All in one scipt following this document: 'https://docs.openstack.org/openstack-helm/latest/install/index.html'

GREEN='\033[0;32m'
# ANSI escape code to reset text color to default
RESET='\033[0m'
console_log() {
  console_log -e "${GREEN}>>> [Openstack] [Setup] $1${RESET}"
}

format_and_execute() {
  script_path=$1
  sed -i -e $script_path
  "./$script_path"
}

DEPLOYMENT_DIR="/tmp/osh"
console_log "Before deployment"
mkdir -p $DEPLOYMENT_DIR

console_log "Cleanup environment"
rm -rf "$DEPLOYMENT_DIR/openstack-helm/*"
rm -rf "$DEPLOYMENT_DIR/openstack-helm-infra/*"
cd $DEPLOYMENT_DIR
git clone https://opendev.org/openstack/openstack-helm.git
git clone https://opendev.org/openstack/openstack-helm-infra.git
pwd
ls -la

console_log "Configure environment"
export OPENSTACK_RELEASE=2023.2
export CONTAINER_DISTRO_NAME=ubuntu
export CONTAINER_DISTRO_VERSION=jammy

# Prepare Kubernetes
console_log "Prepare Kubernetes"
cd "$DEPLOYMENT_DIR/openstack-helm"
ls -la
pwd
format_and_execute ./tools/deployment/common/prepare-k8s.sh

# Deploy Ceph
console_log "Deploy Ceph"
cd "$DEPLOYMENT_DIR/openstack-helm-infra"
ls -la
format_and_execute ./tools/deployment/ceph/ceph-rook.sh
format_and_execute ./tools/deployment/ceph/ceph-adapter-rook.sh

#Setup OpenStack client
console_log "Setup OpenStack client"
cd "$DEPLOYMENT_DIR/openstack-helm"
format_and_execute ./tools/deployment/common/setup-client.sh
