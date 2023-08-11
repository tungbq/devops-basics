# Github Action overview
- https://docs.github.com/en/github-ae@latest/actions/learn-github-actions/understanding-github-actions#overview
# Quick start
- https://docs.github.com/en/github-ae@latest/actions/quickstart
# Github Action - Helloworld
```
name: GitHub Actions Helloworld
on: [push]
jobs:
  Welcome-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo " Hello world! 🎉 The job was automatically triggered by a ${{ github.event_name }} event."
```
