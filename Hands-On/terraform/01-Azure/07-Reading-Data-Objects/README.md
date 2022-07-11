# Terraform Data Object
- Allows Terraform to define and use infrastructure created outside of the current deployment
- The resources could have been deployed as part of another Terraform deployment or with the portal.
- The key difference is that with Data Sources, the source does not become managed by Terraform or part of the Terraform state
- Instead, a Data Source simply references existing infrastructure.
