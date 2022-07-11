source ~/python_venv/bin/activate

## Validate and obtain information about your Ansible inventory
ansible-inventory -i hosts --list

## Test Ansible is able to conenct to all hosts
ansible all -i hosts -m ping

## Running ad hoc commands
ansible all -i hosts -a uptime
ansible all -i hosts -a "free -m"
ansible all -i hosts -a "df -h"

## Running Playbook
#nano playbook.yml
ansible-playbook -i hosts playbook.yml -kK

## Confirm content of the file in all hosts
ansible all -i hosts -a "cat /tmp/testfile.txt"
