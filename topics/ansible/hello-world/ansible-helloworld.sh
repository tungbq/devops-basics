console_log () {
  echo ">>> [Ansible] $1"
}

console_log "Checking if Ansile is installed"
which ansible

console_log "Checking Ansible version"
ansible --version

