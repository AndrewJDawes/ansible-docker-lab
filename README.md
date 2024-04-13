# Ansible: Lab with Docker

## Getting started

1. Open this project in VSCode
1. Open a terminal window in VSCode
1.  Generate an SSH key pair Ansible can use connect to the running Docker containers.
    - Place both keys (private and public) under the `keys` directory and name them `idkey` and `idkey.pub` respectively
    -   Example: `ssh-keygen -t rsa -b 4096 -f ./keys/idkey`
    -   Hit `ENTER` to bypass all prompts (no passphrase)
1.  Open VSCode's command palette and run the `Remote-Containers: Reopen in Container` command
1.  After the container is built and started, open a terminal window in VSCode (should open in the context of the running Docker container) and change directories to the `/workspace/ansible` directory
    -   `cd /workspace/ansible`
1.  Run the Ansible playbook that is in that directory
    -   `ansible-playbook playbook.yml`
1.  Visit http://localhost:4001/, http://localhost:4002/, and http://localhost:4003/ to see the running web servers
1.  Tinker around
    -   For example, customize `/workspace/ansible/templates/index.html` to your liking
1.  Re-run the `ansible-playbook` command to see the changes reflected in the running web servers
