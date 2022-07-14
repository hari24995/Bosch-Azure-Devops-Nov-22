# Hardening GitHub Actions
- GitHub has recently made changes to GitHub Actions to improve security

## How to harden GitHub Workflows
### Reduce permissions
- It is now possible to restrict access to the repository for a GitHub Workflow by changing the permissions for the GITHUB_TOKEN.
- Permission can be set at different levels — organization- or repository-wide by setting the global default permissions, for an entire Workflow or for an individual job inside a Workflow by specifying permissions inside a GitHub Workflow.
- Local permissions override the global defaults
- By setting the global Workflow permissions to "Read repository contents permission", Workflows will only have read access to the codebase — all other permissions need to be set in the Workflows.

### Audit dependencies before installing
- The GitHub Advisory Database collects information about known security vulnerabilities of packages for various ecosystems, including pip and Composer
  - https://github.com/advisories
- npm's audit command can be used to scan project dependencies against the database
- This can be done as part of a GitHub Workflow before installing the dependencies to abort the Workflow execution if vulnerable dependencies are found.
- The audit output can be quite noisy at times, and not all vulnerabilities can be exploited in each project setup. To reduce the number of false positives that come up in the audit, it is possible to filter out vulnerabilities with low severity.
```
jobs:
  test:
    steps:
      - name: Audit Dependencies
        # This step will fail if at least one vulnerability with high severity
        # is found
        run: npm audit --audit-level=high
```
### Avoid executing code during dependency installation
- By default, packages installed with npm can execute arbitrary code by defining install or postinstall scripts in their package.json.
- These scripts can be skipped by using the switch --ignore-scripts
However, using this switch will cause issues with packages that rely on these scripts to perform legitimate installation tasks such as downloading or compiling platform-specific binaries
- In this case, you can manually run the scripts in the Workflow for the packages that use them:
```
jobs:
  test:
    steps:
      - name: Install Dependencies
        run: npm ci --ignore-scripts

      - name: Install Sharp
        working-directory: node_modules/sharp
        run: npm run install
```

### Limit exposure of secrets
- Just like the token permissions, env variables with sensitive information should not be exposed globally in the Workflow, but only for the steps that actually need them.
```
jobs:
  test:
    env:
      # non-sensitive values are fine here
      NODE_ENV: test

    steps:
      - name: Run Tests
        run: npm test
        env:
          # the API key is only needed for this step
          API_KEY: ${{ secrets.API_KEY }}
```
