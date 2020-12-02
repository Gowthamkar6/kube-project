#!/bn/bash

source ../secrets/secrets.sh

if [ "$#" -ne 1 ]; then
    echo "please sepecify environment [prod|uat|staging], eg: $0 uat"
    exit 1

fi

ssh_private_key=../secrets/$1/id_rsa_key
vault_password_file=~/home

ansible-playbook --key-file  ${ssh_private_key} --vault-password-file ${vault_password_file} -i generated/$1/inv-$1.yml -u admin setup.yml  -e vars/$1.yml --tags "app-upgrade"

exit $status
