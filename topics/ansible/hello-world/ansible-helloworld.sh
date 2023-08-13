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

