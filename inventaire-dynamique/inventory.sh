#!/bin/bash

# --list              => renvoyer la liste des machines
# --host <hostname>   => renvoyer les variables

if [ "$1" == "--list" ]; then
    echo '{"machines_debian":{"hosts" : ["machine1"]}}'
fi

if [ "$1" == "--host" ]; then
    echo '{"server":"apache2"}'
fi