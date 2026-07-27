# SSH Basics

## Generate an SSH key pair

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
This creates two files by default:
- `~/.ssh/id_ed25519` (private key — never share this)
- `~/.ssh/id_ed25519.pub` (public key — safe to share)

## Copy your public key to a remote server

```bash
ssh-copy-id user@remote-host
```
This appends your public key to `~/.ssh/authorized_keys` on the remote host, enabling passwordless login.

## Connect to a remote server

```bash
ssh user@remote-host
```

## Connect using a specific key and port

```bash
ssh -i ~/.ssh/id_ed25519 -p 2222 user@remote-host
```

## View known hosts

Every server you connect to gets fingerprinted in:
```bash
cat ~/.ssh/known_hosts
```

## Copy files with SCP

```bash
scp localfile.txt user@remote-host:/home/user/
```