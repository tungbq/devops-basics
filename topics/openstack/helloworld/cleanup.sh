#!/bin/bash

set -e

console_log() {
  echo -e "${GREEN}>>> [Openstack] [Cleanup] $1${RESET}"
}

check_and_delete() {
  namespace_name=$1
  # Check if the namespace exists
  if kubectl get namespace "$namespace_name" &>/dev/null; then
    echo "Namespace '$namespace_name' exists. Deleting resources..."
    kubectl delete all --all --namespace "$namespace_name" || true
    kubectl delete namespace "$namespace_name" || true
  else
    echo "Namespace '$namespace_name' does not exist."
    # Add any handling or exit commands here if needed
  fi
}

cleanup_namespaces() {
  console_log "Cleanup previous k8s resources"
  check_and_delete ceph
  check_and_delete openstack
  check_and_delete osh-infra
  check_and_delete rook-ceph
}

# Set colors for console output
GREEN='\033[0;32m'
RESET='\033[0m'

# Call cleanup function
cleanup_namespaces

console_log "Cleanup completed!"
