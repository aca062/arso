#!/bin/sh
/bin/echo "Actualizar sistema operativo."
/usr/bin/apt -y update
/usr/bin/apt -y upgrade
/bin/echo "Instalar Docker."
/usr/bin/apt-get -y install ca-certificates curl gnupg lsb-release
/usr/bin/mkdir -p /etc/apt/keyrings
/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
/usr/bin/echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
/usr/bin/chmod a+r /etc/apt/keyrings/docker.gpg
/usr/bin/apt-get update
/usr/bin/apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
/bin/echo "Cambiar password"
/bin/echo 'ubuntu:10151' | chpasswd
/usr/sbin/groupadd docker
/usr/bin/gpasswd -a ubuntu docker
/bin/echo "Modificar sshd_config para activar contraseñas"
/bin/sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
/bin/systemctl restart ssh
