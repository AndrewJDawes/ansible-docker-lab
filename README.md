# Ansible: Test with Docker

## Getting started

-   Generate SSH key pair for Ansible to connect to the Docker container
    -   `ssh-keygen -t rsa -b 4096 -f ./keys/idkey`

## Next

-   Try escalating privileges
-   On each Ubuntu container, add sshuser with NOPASSWD to sudoers
    -   `echo "sshuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers`
-   Try running a playbook that requires sudo privileges
