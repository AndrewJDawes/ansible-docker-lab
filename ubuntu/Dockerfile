# https://goteleport.com/blog/shell-acces s-docker-container-with-ssh-and-docker-exec/
FROM ubuntu:latest
ARG username="sshuser"
ARG userpass="sshuser"
ARG usergroup="sshgroup"
RUN apt update && apt install  openssh-server sudo -y
# Create a user “sshuser” and group “sshgroup”
RUN groupadd ${usergroup} && useradd -ms /bin/bash -G ${usergroup},sudo ${username} && echo ${username}:${userpass} | chpasswd
# Create sshuser directory in home
RUN mkdir -p /home/${username}/.ssh
# Copy the ssh public key in the authorized_keys file. The idkey.pub below is a public key file you get from ssh-keygen. They are under ~/.ssh directory by default.
COPY ../keys/idkey.pub /home/${username}/.ssh/authorized_keys
# change ownership of the key file.
RUN chown -R ${username}:${usergroup} /home/${username}/.ssh && chmod 600 /home/${username}/.ssh/authorized_keys
# Start SSH service
RUN service ssh start
# Expose docker port 22
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
