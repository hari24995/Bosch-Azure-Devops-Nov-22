# How to manage Azure DevOps using REST API
## References:
- https://github.com/microsoft/azure-devops-dotnet-samples
- https://docs.microsoft.com/en-us/rest/api/azure/devops/?view=azure-devops-rest-7.1

## To run samples run below commands:
```
setx AZURE_DEVOPS_PAT "i62zgjs476dewyzcjykx3e4cnylwvjerhtniipgcmoia3ihjanqq"
setx AZURE_DEVOPS_PAT "glmu5c22jy56arxtrbf6uqopd6abh557q7ajrcu3cz3rc62ae4lq"
exit
cmd
cd C:\Users\atingupta2005\azure-devops-dotnet-samples\

dotnet build ClientSamples.sln
cd C:\Users\atingupta2005\azure-devops-dotnet-samples\ClientLibrary\Samples\bin\Debug\netcoreapp3.1
ClientSamples.netcore.exe /url:https://dev.azure.com/u10352 /area:* /resource:*
ClientSamples.netcore.exe /url:https://dev.azure.com/ag9465462 /area:* /resource:*
```
