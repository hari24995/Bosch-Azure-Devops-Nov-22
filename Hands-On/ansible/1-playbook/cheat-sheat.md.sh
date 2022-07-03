# Ansible Glossary
- The following Ansible-specific terms are largely used:
  - Control Machine / Node: a system where Ansible is installed and configured to connect and execute commands on nodes.
  - Node: a server controlled by Ansible.
  - Inventory File: a file that contains information about the servers Ansible controls, typically located at /etc/ansible/hosts.
  - Playbook: a file containing a series of tasks to be executed on a remote server.

## Some useful commands
- Testing Connectivity to Nodes
```
ansible all -i hosts -m ping
```

### Debugging
- If you run into errors while executing Ansible commands and playbooks:
```
ansible-playbook -i hosts playbook.yml -v -kK
```

If you need more detail, you can use -vvv and this will increase verbosity of the output
```
ansible-playbook -i hosts playbook.yml -vvv -kK
```
