# Azure DevOps practice: Deploy a simple web app to Azure App Service

This practice project adds an end-to-end Azure DevOps pipeline example for building and deploying a simple Node.js web app to Azure App Service.

## What you'll learn

- Create an Azure Pipelines YAML pipeline
- Build a Node.js app
- Run basic tests
- Publish build artifacts
- Deploy to Azure App Service using the `AzureWebApp@1` task

## Files included

- `app.js` - simple Node.js web app
- `package.json` - project metadata and dependencies
- `azure-pipelines.yml` - pipeline definition

## How to use

1. Create an Azure App Service and Azure Web App in your Azure subscription.
2. Create an Azure DevOps project and connect your repository.
3. Add a service connection for Azure Resource Manager.
4. Push this folder into your repo.
5. Create a pipeline and point it at `azure-pipelines.yml`.

## Update pipeline variables

In Azure DevOps set pipeline variables or variable groups for:

- `azureSubscription` - Azure RM service connection name
- `appName` - Web App name
- `packagePath` - Build artifact path, e.g. `$(Build.ArtifactStagingDirectory)/webapp.zip`

## Quick run

1. Create pipeline from YAML.
2. Run the pipeline.
3. After deployment, open your Azure App Service URL.

## References

- https://learn.microsoft.com/en-us/azure/devops/pipelines/scripts/define-steps?view=azure-devops&tabs=yaml
- https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-web-app?view=azure-devops
