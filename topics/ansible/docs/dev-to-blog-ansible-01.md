## Overview 👋

In this blog post, we'll introduce **Ansible**, explore its core concepts, and walk through the process of creating your first playbook. We'll also cover some useful Ansible commands to get you started on your automation journey.

## Introduction to Ansible 💡

Ansible is an open-source IT automation tool that simplifies application deployment, cloud provisioning, and configuration management across diverse environments. It uses a declarative language to describe the desired state of the system, and then takes the necessary actions to achieve that state. Ansible has become incredibly popular due to its simplicity, agentless architecture, and extensive community support.

## Core Ansible Concepts for Beginners 📘

Before we dive into our first playbook, it's essential to understand some of the core concepts in Ansible:

1. **Inventory**: An inventory file is a list of hosts or groups of hosts against which Ansible will run its tasks. It provides a way to organize and manage the target systems.

2. **Modules**: Modules are the building blocks of Ansible. They are reusable, stand-alone scripts that perform specific tasks, such as managing packages, files, services, or executing commands.

3. **Tasks**: Tasks are individual units of work that Ansible executes on the target hosts. They are defined within a playbook and can invoke one or more Ansible modules.

4. **Playbooks**: Playbooks are **YAML** files that contain one or more plays. A play is a set of tasks that map a group of hosts to a set of roles or tasks to be executed.

5. **Roles**: Roles are a way to organize and package related tasks, files, and templates. They promote code reuse and make playbooks more readable and maintainable.

6. **Facts**: Facts are pieces of information about the target hosts, such as operating system, IP address, or installed packages. Ansible collects these facts automatically and can use them to make decisions or customize task execution.

7. **Handlers**: Handlers are special tasks that are triggered by other tasks in a playbook. They are typically used to restart services or perform specific actions after a change has been made to the system.

By understanding these core concepts, you'll have a solid foundation for working with Ansible and creating more complex and powerful automation workflows.

Now let's move on the practice section and start playing with Ansible

## Hands on

### 1. Create Inventory File

Here's an example of a basic inventory file:

```ini
[webservers]
web1.example.com
web2.example.com

[dbservers]
db1.example.com
db2.example.com
```

For this practice, we will use the localhost as the target host, create a new file named `first-inventory.ini` and add the following content:

```ini
; first-inventory.ini
[my-localhost]
127.0.0.1 ansible_connection=local
```

### 2. Create The First Playbook: Check uptime and OS release

A playbook in Ansible is a set of instructions that define the desired state of a system. It is written in YAML format and contains one or more plays, each of which maps a group of hosts to a set of tasks. Let's create our first playbook that will simply check `uptime` and `OS release` on the target hosts.
Create a new file named `first-playbook.yml` and add the following content:

```yaml
# first-playbook.yml
---
- name: Basic tasks
  hosts: my-localhost
  tasks:
    - name: Execute uptime command
      command: uptime
      register: uptime_result
    - debug: var=uptime_result.stdout_lines

    - name: Check OS release
      command: cat /etc/os-release
      register: os_result
    - debug: var=os_result.stdout_lines
```

Here's what each section of the playbook means:

`---` indicates the start of a YAML document.
`hosts`: all specifies that the tasks in this play should be executed on all hosts in the inventory file.
`tasks`: marks the beginning of the list of tasks to be executed.
`name`: print Hello World is a human-readable description of the task.
`command`: the shell command to be executed on the target hosts.
`register`: capture the output from task execution and store it in a variable.
`debug`: is an Ansible module used to print statements.

### 3. Run the Ansible playbook

To run the playbook, use the following Ansible command:

```bash
ansible-playbook -i first-inventory.ini first-playbook.yml
```

### 4. The result

Once the command executed successfully, you would see the outout similar to:
```bash

```
