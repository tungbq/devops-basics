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
│   └── role2/
│       ├── tasks/
│       ├── handlers/
│       ├── templates/
│       ├── defaults/
│       └── meta/
├── main.yml (your main playbook file)
```

# How to run
- Execute this command: `ansible-playbook -i inventory.ini -v main.yml` (tested on WSL2 Ubuntu)
