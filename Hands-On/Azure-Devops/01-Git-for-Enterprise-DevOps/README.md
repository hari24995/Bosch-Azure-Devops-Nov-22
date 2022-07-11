# Scaling Git for Enterprise DevOps
## Lab - Git Branching Model for Continuous Delivery
- Create branch
- Make changes in the file
- Commit changes
- Merge

## Lab - Pull Requests
- Change Master branch policies in Azure Repo Branches
- Enable "Require Number of Reviewers"
	- Enable "Allow to approve their own changes"
- Now unable to push to master branch
- Create a new branch and push that
- Create pull request and then approve the merge

## Lab - GitHub and Azure Boards integration
- Make GitHub integration from Project settings
- Create a new work item
- Note the work item id
- Do some changes in GitHub code
	- While committing the changes specify in Commit Description - "Fixed AB#<WorkItemID>"
- Refresh Azure work items
	- Note the status of work item is changed to closed.
