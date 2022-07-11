source ~/python_venv/bin/activate

## Running Playbook
ansible-playbook -i hosts jinja2_playbook.yml
ansible all -i hosts -a "cat /tmp/ansible_template.out"
