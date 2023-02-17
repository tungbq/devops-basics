echo ">>> Building ansible runner..."
docker build -t ansible-runner -f AnsibleEnv.dockerfile .
echo ">>> Execute ansible playbook (ping google)..."
docker run --rm ansible-runner ansible-playbook ping-google.yml
