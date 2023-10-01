#!/usr/bin/env bash
# No root needed
# ansible ubuntu-1 -m ping
# Become root and ask for sudo password
# ansible all -b -K -m ping
# Become root and do not ask for password - assumes user has NOPASSWD in remote host's /etc/sudoers
ansible all -b -m ping
