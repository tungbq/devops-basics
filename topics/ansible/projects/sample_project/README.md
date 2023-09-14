# Sample project looks like:
```
my_ansible_project/
├── roles/
│   ├── role1/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── handlers/
│   │   │   └── main.yml
│   │   ├── templates/
│   │   ├── defaults/
│   │   └── meta/
│   ├── role2/...(same as role1/)
```

# How to run
- Execute this command: `ansible-playbook -i inventory.ini main.yml` (tested on WSL2 Ubuntu)
