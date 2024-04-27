# Ansible helloworld example

- Inventory file: [inventory.init](./inventory.init)
- First playbook file: [first-playbook.yml](./first-playbook.yml)

- Run the first playbook

```bash
# Navigate to code location
cd topics/ansible/basic/helloworld
# Run playbook
ansible-playbook -i inventory.ini first-playbook.yml
```

- Or use the demo script if you want: [ansible-helloworld.sh](./ansible-helloworld.sh)
