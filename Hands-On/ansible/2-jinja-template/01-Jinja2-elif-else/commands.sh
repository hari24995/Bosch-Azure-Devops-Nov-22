source ~/python_venv/bin/activate

## Running Playbook
ansible-playbook -i hosts facts_playbook.yml
ansible-playbook -i hosts jinja2_playbook.yml
