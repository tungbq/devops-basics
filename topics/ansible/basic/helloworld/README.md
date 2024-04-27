# Ansible helloworld example

- Inventory file: [first-inventory.ini](./first-inventory.ini)
- First playbook file: [first-playbook.yml](./first-playbook.yml)

- Run the first playbook

```bash
# Navigate to code location under `devops-basics` repo
cd devops-basics/topics/ansible/basic/helloworld

# Run playbook
ansible-playbook -i first-inventory.ini first-playbook.yml
```

- Or use the demo script if you want: [ansible-helloworld.sh](./ansible-helloworld.sh)
