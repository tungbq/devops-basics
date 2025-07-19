## Basics of GitHub Actrion

## Github Action - Helloworld

- Create new workflow

```
name: GitHub Actions Helloworld
on: [push]
jobs:
  Welcome-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo " Hello world! 🎉 The job was automatically triggered by a ${{ Github.event_name }} event."
```
