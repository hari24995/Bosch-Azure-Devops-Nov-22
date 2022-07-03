# Isolation via File Layout
- To achieve isolation between environments, you need to do the following:
  - Put the Terraform configuration files for each environment into a separate folder
    - For example, all of the configurations for the staging environment can be in a folder called stage and all the configurations for the production environment can be in a folder called prod.
    - Configure a different backend for each environment

- With this approach, the use of separate folders makes it much clearer which environments you’re deploying to, and the use of separate state files, with separate authentication mechanisms, makes it significantly less likely that a screw up in one environment can have any impact on another.
