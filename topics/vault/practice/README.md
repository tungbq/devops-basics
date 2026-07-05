# Vault Practice

## Exercises

### Exercise 1: KV Secrets Engine

1. Start Vault in dev mode
2. Enable the `kv-v2` secrets engine at path `secret/`
3. Store database credentials (host, port, username, password) under `secret/database/postgres`
4. Read them back using `vault kv get`
5. Update the password and verify the new version is stored
6. Roll back to version 1

**Reference**: https://developer.hashicorp.com/vault/docs/secrets/kv/kv-v2

---

### Exercise 2: AppRole Authentication

1. Enable the AppRole auth method
2. Create a policy that allows read access to `secret/data/myapp/*`
3. Create a role with that policy attached
4. Retrieve a `role_id` and generate a `secret_id`
5. Login using AppRole to get a token
6. Use that token to read a secret

**Reference**: https://developer.hashicorp.com/vault/docs/auth/approle

---

### Exercise 3: Vault with Kubernetes (Vault Agent Injector)

1. Install Vault on a local Kubernetes cluster using Helm
2. Configure Kubernetes authentication in Vault
3. Deploy the Vault Agent Injector
4. Create a sample app with Vault annotations to inject a secret as a file
5. Verify the secret appears in `/vault/secrets/` inside the pod

**Reference**: https://developer.hashicorp.com/vault/docs/platform/k8s/injector

---

### Exercise 4: Dynamic Database Credentials

1. Start a PostgreSQL container
2. Enable the database secrets engine in Vault
3. Configure Vault with PostgreSQL connection details
4. Create a role that generates short-lived credentials
5. Generate credentials and connect to PostgreSQL
6. Observe that the credentials expire automatically

**Reference**: https://developer.hashicorp.com/vault/docs/secrets/databases/postgresql

---

### Exercise 5: Transit Secrets Engine (Encryption as a Service)

1. Enable the transit secrets engine
2. Create an encryption key named `my-key`
3. Encrypt a plaintext string via the API
4. Decrypt it back to verify round-trip
5. Rotate the key and verify existing ciphertext can still be decrypted

**Reference**: https://developer.hashicorp.com/vault/docs/secrets/transit
