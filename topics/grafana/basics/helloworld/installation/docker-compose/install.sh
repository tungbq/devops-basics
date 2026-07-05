#!/bin/bash
set -e

echo "Starting Grafana and Prometheus..."
docker-compose up -d

echo "Waiting for services to be ready..."
sleep 10

echo "Grafana should be available at http://localhost:3000 (admin/admin)"
echo "Prometheus UI at http://localhost:9090"