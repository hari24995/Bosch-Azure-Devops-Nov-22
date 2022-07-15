# GitHub Actions
## Introduction to GitHub Workflows & Actions
### GitHub Hosted Runners
 - Runners are the machines that execute jobs in a GitHub Actions workflow. For example, a runner can clone your repository locally, install testing software, and then run commands that evaluate your code.
 - Reference: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners

### Enable actions:
  - Open Settings -> Actions -> General and enable: Allow all actions and reusable workflows


## Create Our First Workflow
https://github.com/atingupta2005/Bosch-github-actions-training/tree/lets-create-our-first-workflow

- To enable debugging set secret to true
  - ACTIONS_RUNNER_DEBUG
  - ACTIONS_STEP_DEBUG

## Using a Simple Action
https://github.com/atingupta2005/Bosch-github-actions-training/tree/using-a-simple-action

## The Checkout Action
https://github.com/atingupta2005/Bosch-github-actions-training/tree/the-checkout-action

## Triggering a Workflow with GitHub Events & Activity Types
https://github.com/atingupta2005/Bosch-github-actions-training/tree/triggering-a-workflow-with-github-events-and-activity-types

## Setting a Schedule to Trigger Workflows
https://github.com/atingupta2005/Bosch-github-actions-training/tree/setting-a-schedule-to-trigger-workflows
- Scheduled GitHub Actions run on the default or base branch, as specified by the documentation:
  - https://docs.github.com/en/actions/reference/events-that-trigger-workflows#scheduled-events
- The shortest interval you can run scheduled workflows is once every 5 minutes.
- There is no guarantee that the workflow will run every x minutes.
- The scheduled workflow may be not triggered at that minute

## Default & Custom Environment Variables
https://github.com/atingupta2005/Bosch-github-actions-training/tree/default-and-custom-environment-variables
- Refer: https://docs.github.com/en/actions/learn-github-actions/environment-variables

## Using the GITHUB_TOKEN Secret for Authentication
https://github.com/atingupta2005/Bosch-github-actions-training/tree/using-the-github-token-secret-for-authentication
- Documentation: https://docs.github.com/en/actions/security-guides/automatic-token-authentication
- GitHub provides a token that you can use to authenticate on behalf of GitHub Actions
- When you enable GitHub Actions, GitHub installs a GitHub App on your repository
- The GITHUB_TOKEN secret is a GitHub App installation access token.
- You can use the installation access token to authenticate on behalf of the GitHub App installed on your repository
- The token's permissions are limited to the repository that contains your workflow
- The GITHUB_TOKEN expires when a job finishes or after a maximum of 24 hours.
- The token is also available in the github.token context.
- You can use the GITHUB_TOKEN by using the standard syntax for referencing secrets: ${{ secrets.GITHUB_TOKEN }}
- You can use the permissions key in your workflow file to modify permissions for the GITHUB_TOKEN for an entire workflow or for individual jobs.
- We can change the permissions of the GITHUB_TOKEN to make it even more secure. Just go to your repository or organization Settings, then click on Actions.
### Personal Access Token vs GITHUB_TOKEN
- If you are thinking _"why should I use the GITHUB_TOKEN instead of my normal PAT?", remember that a Personal Access Token is always available, so if someone is able to steal that PAT they can potentially do some harm.
- The GITHUB_TOKEN instead expires just right after the job is over. So even if someone is able to steal it (which is almost impossible), they basically can't do anything wrong.

## Expressions & Contexts
https://github.com/atingupta2005/Bosch-github-actions-training/tree/expressions-and-contexts
- Refer: https://docs.github.com/en/actions/learn-github-actions/contexts

## The If key & Job Status Check Functions
https://github.com/atingupta2005/Bosch-github-actions-training/tree/the-if-key-and-job-status-check-functions

## Deploying the Application to Azure
- Refer: https://docs.microsoft.com/en-us/azure/app-service/deploy-github-actions?tabs=applevel

## Self Hosted Runners
- Refer: https://github.com/atingupta2005/Bosch-github-actions-training/settings/actions/runners

## Autoscaling with self-hosted runners
- Refer: autoscaling-with-self-hosted-runners
