source ~/python_venv/bin/activate

## Generate SSH Keys
```
ssh-keygen -f ~/.ssh/ansible_id_rsa -N ''
chmod 0600 ~/.ssh/ansible_id_rsa
```

## Move to Ansible folder
```
cd ~/Bosch-Azure-Devops-June-22/Hands-On/ansible/1-playbook
```

## Update Hosts
```
REMOTE_HOST_IP="20.119.60.195"
echo $REMOTE_HOST_IP
sed -i "s/demouser/$USER/g" hosts
sed -i "s/vm1 ansible_host=20.119.60.195/vm1 ansible_host=$REMOTE_HOST_IP/g" hosts
```


## Validate and obtain information about your Ansible inventory
```
ansible-inventory -i hosts --list
```

## Deploy Public Key to host
```
ssh-copy-id -i ~/.ssh/ansible_id_rsa.pub $USER@$REMOTE_HOST_IP
```

## Test the key
```
ssh -i ~/.ssh/ansible_id_rsa $USER@$REMOTE_HOST_IP
exit
```

## Test Ansible is able to conenct to all hosts
```
ansible all -i hosts -m ping
```

## Running ad hoc commands
```
ansible all -i hosts -a uptime
ansible all -i hosts -a "free -m"
ansible all -i hosts -a "df -h"
```

## Running Playbook
```
#nano playbook.yml
ansible-playbook -i hosts playbook.yml -kK
```

## Confirm content of the file in all hosts
```
ansible all -i hosts -a "cat /tmp/testfile.txt"
```
