#!/bin/bash

# Affiche la commande
set -x
# Stop on error
set -e

# Installer python
ansible machines_debian -m raw -a "apt install python3 -y" --become
ansible machines_centos -m raw -a "dnf install python3 -y" --become
# version mutualisée
ansible all -m raw -a "{{ pkg }} install python3 -y" --become

# changer le motd (module copy)
ansible all -m copy -a "content=Bienvenue dest=/etc/motd" --become

# Installer apache grâce au module yum ou apt
ansible machines_debian -m apt -a "name=apache2 state=present" --become
ansible machines_centos -m yum -a "name=httpd state=present" --become
# version mutualisée
ansible all -m package -a "name={{ server }}" --become

# Copier un fichier de la machine cliente vers les machines distantes (fichier html à placer dans /var/www/html/)
ansible all -m copy -a "src=index.html dest=/var/www/html/" --become

# Démarrer apache (module service)
ansible machines_debian -m service -a "name=apache2 state=started" --become
ansible machines_centos -m service -a "name=httpd state=started" --become
# version mutualisée
ansible all -m service -a "name={{ server }} state=started" --become

# reboot des machines
ansible all -m reboot --become
