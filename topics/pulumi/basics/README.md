# Basics of Pulumi

## Demo

Run `./pulumi_helloworld.sh` to deploy a minimal Pulumi program (YAML runtime, `random` provider) using a temporary local state backend. No cloud account or language runtime is required, only the [Pulumi CLI](https://www.pulumi.com/docs/iac/download-install/).

The script creates a project and a stack, runs `pulumi preview` and `pulumi up`, prints the stack outputs, then destroys everything and cleans up.
