# OpenTofu Practice

## Exercises

### Exercise 1: Local Resources (No Cloud Required)

1. Create an OpenTofu configuration that generates multiple local files
2. Use `count` or `for_each` to create 3 files with different content
3. Use variables and outputs
4. Run `tofu plan`, `tofu apply`, verify the files, then `tofu destroy`

**Goal**: Get comfortable with the core OpenTofu workflow

---

### Exercise 2: Migrate from Terraform to OpenTofu

1. Take an existing Terraform configuration (or use one from `topics/terraform/basics/`)
2. Follow the migration guide: https://opentofu.org/docs/intro/migration/
3. Run `tofu init -upgrade` to migrate
4. Verify state is intact with `tofu state list`
5. Run `tofu plan` and confirm no changes are detected

**Goal**: Understand OpenTofu's Terraform compatibility

---

### Exercise 3: State Encryption (OpenTofu-Exclusive)

1. Create a simple configuration with a local resource
2. Add an `encryption` block using the `pbkdf2` key provider
3. Apply the configuration — observe the state file is now encrypted
4. Verify you cannot read the state file directly with `cat`
5. Run `tofu state list` to confirm Tofu can still read it

**Reference**: https://opentofu.org/docs/language/state/encryption/

---

### Exercise 4: Writing and Running Tests

1. Create a module that manages a local directory structure
2. Write a `.tftest.hcl` test file with at least 2 test cases
3. Run `tofu test` and observe results
4. Intentionally break a test assertion to see the failure output

**Reference**: https://opentofu.org/docs/language/tests/

---

### Exercise 5: Provider Configuration with Multiple Environments

1. Create a configuration with `dev` and `prod` workspaces
2. Use `terraform.workspace` to set different values per environment
3. Use `tofu workspace new dev` and `tofu workspace new prod`
4. Apply to each workspace and compare state files

**Reference**: https://opentofu.org/docs/language/state/workspaces/
