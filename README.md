# Ansible: Lab with Docker

## Getting started

1. Make sure you have the following installed on your local machine:
    - [Docker](https://www.docker.com/products/docker-desktop)
    - [Visual Studio Code](https://code.visualstudio.com/)
    - [Remote - Containers extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
1. Make sure Docker Desktop is running on your local machine
1. Clone this repository to your local machine
1. Use VSCode to open the repository folder on your local machine
    - File > Open Folder > Select the path to the cloned repository
1. Open a new Terminal window in VSCode
    - Terminal > New Terminal
    - If you are prompted to select a shell, choose `bash`
1. Copy/paste this command into the Terminal window and press `ENTER`: `ssh-keygen -t rsa -b 4096 -f ./keys/idkey`. As any prompts appear, press `ENTER` to accept the default values.
    - This will generate an SSH key pair Ansible can use connect to the running Docker containers.
    - It will place both keys (private and public) under the `keys` directory within the repository and name them `idkey` and `idkey.pub` respectively
    - It is important to use the defaults for the key generation process, as the Ansible playbook is expecting the keys to be named `idkey` and `idkey.pub`
    - Additionally, it is important to not set a passphrase for the key, as the Ansible playbook is not configured to handle that
1. Open VSCode's command palette and run the `Dev Containers: Rebuild and Reopen in Container` command
    - This will build and start a Docker container with all the necessary dependencies to run the Ansible playbook
    - It will also build and start several other Docker containers on the same network
    - These other containers will be the targets of the Ansible playbook
1. Wait until the containers are built and started
    - VSCode will automatically open a new window in the context of the running Docker container
1. Visit http://localhost:4001/, http://localhost:4002/, and http://localhost:4003/
    1. Notice nothing is being served
1. Open a new Terminal window in VSCode
    - Terminal > New Terminal
    - This new window will open in the context of the running Docker container
1. Copy/paste this command into the Terminal: `cd /workspace/ansible`
    - This will change directories to the `/workspace/ansible` directory inside the running container
1. Copy/paste this command into the Terminal:`ansible-playbook playbook.yml`
    - This will execute the Ansible playbook against the other Docker containers running in the same network
    - It will install and configure Apache web servers on the other Docker containers
1. Visit http://localhost:4001/, http://localhost:4002/, and http://localhost:4003/ to see the running web servers
1. Tinker around!
    1. Change the content of the webpages served by the web servers
        - Customize `/workspace/ansible/templates/index.html` to your liking
        - Re-run the `ansible-playbook playbook.yml` command
        - Visit http://localhost:4001/, http://localhost:4002/, and http://localhost:4003/ to see your changes reflected in the running web servers
    2. Stop the web servers
        - Customize `/workspace/ansible/playbook.yml` to stop the web servers
            - Hint: Change the `state` parameter of the `service` module to `stopped`
        - Re-run the `ansible-playbook playbook.yml` command
        - Visit http://localhost:4001/, http://localhost:4002/, and http://localhost:4003/ to see the changes reflected in the running web servers
    3. Make the state of the web servers dynamic using variables
        - Create a `/workspace/ansible/vars.yml` file
        - Define a variable named `apache_service_state` in the `/workspace/ansible/vars.yml` file to control the state of the web servers
        - Customize `/workspace/ansible/playbook.yml` to use the variable defined in `/workspace/ansible/vars.yml` to control the state of the web servers
        - Re-run the `ansible-playbook playbook.yml` command
        - Visit http://localhost:4001/, http://localhost:4002/, and http://localhost:4003/ to see the changes reflected in the running web servers
