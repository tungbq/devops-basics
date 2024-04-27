## Overview 👋

In this blog post, we'll introduce **Ansible**, explore its core concepts, and walk through the process of creating your first playbook. We'll also provide the additional resources for you to explore the Ansible.

## Introduction to Ansible 💡

Ansible is an open-source IT automation tool that simplifies application deployment, cloud provisioning, and configuration management across diverse environments. It uses a declarative language to describe the desired state of the system, and then takes the necessary actions to achieve that state. Ansible has become incredibly popular due to its simplicity, agentless architecture, and extensive community support.
**Document:** [ansible.com](https://www.ansible.com/), [ansible basics](https://github.com/tungbq/devops-basics/tree/main/topics/ansible)

## Install Ansible 🔧

Use `pip` in your selected Python environment to install the full Ansible package for the current user:

```bash
python3 -m pip install --user ansible
```

Or follow this [official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible) for more installation detailed.

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

## Hands on 👷

NOTE: The sample code for this hands on could be found [here](https://github.com/tungbq/devops-basics/tree/main/topics/ansible/basic/helloworld)

### 1. Create Inventory File

Here's an example of a basic inventory file:

```ini
[webservers]
web1.example.com
web2.example.com

[dbservers]
db1.example.com
db2.example.com
; other hosts definition as needed
```

To keep this practice simple, we will use the `localhost` as the target host, create a new file named `first-inventory.ini` and add the following content:

```ini
; first-inventory.ini
[my-localhost]
127.0.0.1 ansible_connection=local
```

Or you can use my sample code on [**GitHub**](https://github.com/tungbq/devops-basics/blob/main/topics/ansible/basic/helloworld/first-inventory.ini)

### 2. Create The First Playbook - Check uptime and OS release

Let's create our first playbook that will simply check `uptime` and `OS release` on the target hosts.
Create a new file named `first-playbook.yml` and add the following content:

```yaml
# first-playbook.yml
---
- name: Basic tasks
  # This host is defined in the `first-inventory.ini`
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

Or you can use my sample code on [**GitHub**](https://github.com/tungbq/devops-basics/blob/main/topics/ansible/basic/helloworld/first-playbook.yml)

Here's what each section of the playbook means:

`---` Indicates the start of a YAML document.
`hosts`: All specifies that the tasks in this play should be executed on all hosts in the inventory file.
`tasks`: Marks the beginning of the list of tasks to be executed.
`name`: Provide a human-readable description of the task.
`command`: The shell command to be executed on the target hosts.
`register`: Capture the output from task execution and store it in a variable.
`debug`: An Ansible module used to print statements.

### 3. Run the Ansible playbook

To run the playbook, use the following Ansible command:

```bash
ansible-playbook -i first-inventory.ini first-playbook.yml
```

BONUS: I wrote a small script to automate this demo [ansible-helloworld.sh](https://github.com/tungbq/devops-basics/blob/main/topics/ansible/basic/helloworld/ansible-helloworld.sh). You could use it if interested.

### 4. The result

Once the command executed successfully, you would see the output similar to:

```bash
PLAY [Basic tasks] ************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************
ok: [127.0.0.1]

TASK [Execute uptime command] *************************************************************************************************************************************************************
changed: [127.0.0.1]

TASK [debug] ******************************************************************************************************************************************************************************
ok: [127.0.0.1] => {
    "uptime_result.stdout_lines": [
        " 15:02:46 up  4:24,  2 users,  load average: 6.62, 4.45, 3.50"
    ]
}

TASK [Check OS release] *******************************************************************************************************************************************************************
changed: [127.0.0.1]

TASK [debug] ******************************************************************************************************************************************************************************
ok: [127.0.0.1] => {
    "os_result.stdout_lines": [
        "PRETTY_NAME=\"Ubuntu 22.04.2 LTS\"",
        "NAME=\"Ubuntu\"",
        "VERSION_ID=\"22.04\"",
        "VERSION=\"22.04.2 LTS (Jammy Jellyfish)\"",
        "VERSION_CODENAME=jammy",
        "ID=ubuntu",
        "ID_LIKE=debian",
        "HOME_URL=\"https://www.ubuntu.com/\"",
        "SUPPORT_URL=\"https://help.ubuntu.com/\"",
        "BUG_REPORT_URL=\"https://bugs.launchpad.net/ubuntu/\"",
        "PRIVACY_POLICY_URL=\"https://www.ubuntu.com/legal/terms-and-policies/privacy-policy\"",
        "UBUNTU_CODENAME=jammy"
    ]
}

PLAY RECAP ********************************************************************************************************************************************************************************
127.0.0.1                  : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Congratulations 🎉, you've successfully created and run the first Ansible playbook! 💥

## Conclusion ✏️

In this post, you already explored the basic Ansible concepts, wrote, and ran your own `first playbook` on your `localhost`. In the future, I will create another post for more advanced Ansible examples.

If you want to learn more about DevOps, you could visit the [devops-basics](https://github.com/tungbq/devops-basics) for more content about various DevOps tools and concepts like Ansible, Docker, K8s, Terraform, Cloud, CI/CD, ...

And kindly consider supporting me by giving it a star ⭐️.

<table>
	<tr>
		<td>
			<a href="https://github.com/tungbq/devops-basics" style="text-decoration: none;"><strong>Star devops-basics ⭐️ on GitHub</strong></a>
		</td>
	</tr>
</table>
Thank you for reading and happy coding! 💖
