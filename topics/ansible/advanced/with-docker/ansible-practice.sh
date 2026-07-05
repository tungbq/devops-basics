#!/bin/bash
echo ">>> Building ansible runner..."
docker build -t ansible-runner -f AnsibleEnv.dockerfile .
echo ">>> Execute ansible playbook (ping google)..."
docker run --rm -v "$(pwd)/basic":/basic -w /basic ansible-runner ansible-playbook ping-google.yaml
echo ">>> Execute ansible playbook (check stats)..."
docker run --rm -v "$(pwd)/basic":/basic -w /basic ansible-runner ansible-playbook check-stats.yaml
