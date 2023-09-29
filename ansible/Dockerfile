FROM ubuntu:latest
ARG username="sshuser"
ARG userpass="sshuser"
ARG usergroup="sshgroup"
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update && apt-get install -y \
    ansible
RUN apt update && apt install openssh-client sudo -y
# Create a user “sshuser” and group “sshgroup”
RUN groupadd ${usergroup} && useradd -ms /bin/bash -G ${usergroup},sudo ${username} && echo ${username}:${userpass} | chpasswd
# Create sshuser directory in home
RUN mkdir -p /home/${username}/.ssh
# Copy the ssh public key in the authorized_keys file. The idkey.pub below is a public key file you get from ssh-keygen. They are under ~/.ssh directory by default.
COPY ../keys/idkey /home/${username}/.ssh/idkey
COPY ../keys/idkey.pub /home/${username}/.ssh/idkey.pub
# change ownership of the key file.
RUN chown -R ${username}:${usergroup} /home/${username}/.ssh && chmod 600 /home/${username}/.ssh/idkey && chmod 644 /home/${username}/.ssh/idkey.pub
