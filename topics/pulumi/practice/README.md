# Pulumi Practice

## Exercises

### Exercise 1: Hello World with a Local Backend (No Cloud Required)

1. Run `topics/pulumi/basics/pulumi_helloworld.sh` and read the output
2. Recreate the project by hand: `pulumi login --local`, then `pulumi new yaml` in an empty directory
3. Add a `random:RandomPet` resource, run `pulumi preview`, `pulumi up`, then `pulumi destroy`

**Goal**: Get comfortable with the core Pulumi workflow and the project/stack/resource model

---

### Exercise 2: Use a Real Programming Language

1. Run `pulumi new python` (or `typescript`) in an empty directory
2. Add a `pulumi_random.RandomPet` resource and export its `id`
3. Use a `for` loop to create 3 pets and export them as a list
4. Run `pulumi up` and check the result with `pulumi stack output`

**Goal**: See what general-purpose languages add over a DSL (loops, functions)

---

### Exercise 3: Stacks and Config

1. Create two stacks: `pulumi stack init dev` and `pulumi stack init prod`
2. Read a config value in your program (for example `length`) and set it per stack with `pulumi config set length 2` / `pulumi config set length 4`
3. Run `pulumi up` on each stack and compare the outputs
4. Use `pulumi stack ls` and `pulumi stack select` to switch between them

**Reference**: https://www.pulumi.com/docs/iac/concepts/config/

---

### Exercise 4: Provision an S3 Bucket (Cloud Account Required)

1. Configure AWS credentials (see the [`aws`](../../aws/) topic)
2. Run `pulumi new aws-python` and keep the default S3 bucket program
3. Run `pulumi preview`, `pulumi up`, and confirm the bucket exists with `aws s3 ls`
4. Run `pulumi destroy` to avoid leaving resources behind

**Goal**: Provision a real cloud resource with Pulumi

---

### Exercise 5: Pulumi vs Terraform

1. Take the Terraform example in `topics/terraform/basics/`
2. Rewrite the same resources as a Pulumi program (or try `pulumi convert --from terraform`)
3. Compare how state, config and outputs work in each tool

**Reference**: https://www.pulumi.com/docs/iac/concepts/vs/terraform/
