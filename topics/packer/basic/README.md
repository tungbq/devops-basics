# Build an Ubuntu machine image on AWS with Packer

## Pre

- AWS account
- Packer installed

## Init

```bash
packer init .
```

## Build

```bash
packer build aws-ubuntu.pkr.hcl

# ...
# ==> Wait completed after 5 minutes 15 seconds
# ==> Builds finished. The artifacts of successful builds are:
# --> learn-packer.amazon-ebs.ubuntu: AMIs were created:
# us-west-2: ami-xxxxyyyyzzzztttt
```

## Verify

- Go to AWS Console `us-west-2` (The region we build packer AMI): https://us-west-2.console.aws.amazon.com/ec2/home?region=us-west-2#Images:visibility=owned-by-me
- You now can see your AMI with name: `learn-packer-linux-aws-redis-<timestamp>`
  ![](./assets/ami-on-aws.png)

## Cleanup

- Once you dont want to use the AMI anymore, follow https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/deregister-ami.html to delete it.
