# SSH

## 1. What is SSH?

### Overview

- SSH (Secure Shell) is a network protocol that allows secure, encrypted communication between two systems over an unsecured network.
- It is most commonly used to remotely log into servers, execute commands, and transfer files (via SCP/SFTP), replacing older insecure protocols like Telnet and rlogin.
- SSH uses public-key cryptography to authenticate the remote computer and, optionally, to authenticate the user.

### Official website documentation of SSH

- https://www.openssh.com/
- https://www.ssh.com/academy/ssh/protocol

## 2. Prerequisites

- Basic Linux command line usage
- Basic understanding of networking (client-server model, ports)

## 3. Installation

### How to install SSH?

On most Linux distributions, the SSH client is installed by default. To install the SSH server:

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

# RHEL/CentOS
sudo yum install openssh-server -y
sudo systemctl enable sshd
sudo systemctl start sshd
```

Verify it's running:
```bash
sudo systemctl status ssh
```

## 4. Basics of SSH

### Getting started with SSH

- To get started visit **topics/ssh/basics**

## 5. Beyond the Basics

### Exploring Advanced Examples

- To get more advanced examples/hands on visit **topics/ssh/advanced**

## 6. More...

### Cheatsheet

- `ssh user@host` — connect to a remote host
- `ssh -p 2222 user@host` — connect on a custom port
- `ssh-keygen -t ed25519` — generate a new key pair
- `ssh-copy-id user@host` — copy your public key to a remote host
- `scp file.txt user@host:/path/` — copy a file to a remote host
- `ssh -L 8080:localhost:80 user@host` — local port forwarding

### Recommended Books

- "SSH Mastery" by Michael W Lucas