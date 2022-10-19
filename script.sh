#!/bin/sh
/bin/echo "Actualizar repositorios"
/usr/bin/apt -y update
/usr/bin/apt -y upgrade
/bin/echo "Cambiar password"
/bin/echo 'aca062:10151' | chpasswd
/bin/echo "Modificar sshd_config"
/bin/sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
/bin/systemctl restart ssh
