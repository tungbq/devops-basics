## SSH practice

1. **Host aliases**: add an entry to `~/.ssh/config` (see [`advanced/`](../advanced/)) for one of your real servers, then connect with just `ssh myhost` instead of the full `ssh -i ... -p ... user@host` command.
2. **Local port forwarding**: `ssh -L 8080:localhost:80 user@remote-host` — a service only listening on `remote-host`'s localhost (not exposed externally) becomes reachable at `http://localhost:8080` on your machine, tunneled entirely through the SSH connection.
3. **Jump host / bastion access**: `ssh -J bastion-host target-host` reaches a private `target-host` that's only reachable from `bastion-host` — no separate manual hop, and no need to copy your private key onto the bastion.

- Official OpenSSH manual: https://man.openbsd.org/ssh
- SSH config file reference: https://man.openbsd.org/ssh_config
