# Deploying App to Azure Web App
## Create Azure App Service on .Net Core 3.1(LTS)
## Generate deployment credentials
- A publish profile is an app-level credential. Set up your publish profile as a GitHub secret.
  - Go to your app service in the Azure portal.
  - On the Overview page, select Get Publish profile.
  - Save the downloaded file. You'll use the contents of the file to create a GitHub secret.

## Configure the GitHub secret
- In GitHub, browse your repository, select Settings > Secrets > Add a new secret.
- To use app-level credentials, paste the contents of the downloaded publish profile file into the secret's value field. Name the secret AZURE_WEBAPP_PUBLISH_PROFILE.
 -When you configure your GitHub workflow, you use the AZURE_WEBAPP_PUBLISH_PROFILE in the deploy Azure Web App action. For example:
```
- uses: azure/webapps-deploy@v2
  with:
    publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
```

## Set up the environment
```
- name: Setup Dotnet 3.3.x
      uses: actions/setup-dotnet@v1
      with:
        dotnet-version: '3.3.x'
```

## Build the web app
```
- name: dotnet build and publish
  run: |
    dotnet restore
    dotnet build --configuration Release
    dotnet publish -c Release -o '${{ env.AZURE_WEBAPP_PACKAGE_PATH }}/myapp'
```

## Deploy to App Service
- Refer: https://github.com/atingupta2005/Bosch-github-actions-training/tree/deploy-to-web-app
