# Welcome to Argo CD

## Install Argo CD and the CLI

- Run `./install_argocd.sh`

## Access the Web UI

### Initial password

- Run `argocd admin initial-password -n argocd` to get the initial password
- Login with admin and the above password

## Deloy your first application Via UI

### Create An Application From A Git Repository

#### Check service

`kubectl get services`

#### Port forwarding to check the app

- Syntax: (kubectl port-forward service/<service-name> <local-port>:<service-port>)
- Run cmd: `kubectl port-forward service/guestbook-ui 8082:80`
- NOTE: You can replace 8082 by your own port depends on your enviroment

#### Verify the result

- Visit http://localhost:8082
- Or via cmd: `curl localhost:8082`
- Once the app is deployed successfully and service up and running with port-forwarding, we should see something like
  ![guestbook-ui-demo](../../../assets/images/argocd/guestbook-ui-demo.png)

## Working with the ArgoCD CLI

- Check out: https://argo-cd.readthedocs.io/en/stable/getting_started/#creating-apps-via-cli
