#!/bin/bash

console_log() {
  echo ">>> [Ansible] $1"
}

check_tool_exist() {
  tool_name="ansible"
  if command -v $tool_name &>/dev/null; then
    echo "$tool_name is installed."
  else
    echo "$tool_name is not installed. Please install first"
  fi
}

console_log "Checking if Ansile is installed"
check_tool_exist

console_log "Checking Ansible version"
ansible --version

console_log "Checking inventory host"
ansible all --list-hosts -i first-inventory.ini

console_log "Send ping command to the host"
ansible all -m ping -i first-inventory.ini

console_log "Run the first playbook - get uptime and OS release on localhost"
# Note: `-v` flag if you want to verbose the ansible execution result
ansible-playbook -i first-inventory.ini first-playbook.yml
