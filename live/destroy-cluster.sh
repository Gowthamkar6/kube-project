#!/bin/bash
set -e

if [ "$# -ne 2 ]; then
    echo "specify environment [prod|uat|staging] and action to [destroy], eg $0 uat destroy"
    exit 1
fi

init=../secrets/secrets.sh
ansible-vault decrypt ${init} --vault-password-file ${vault_passowrd_file}
source ../secrets/secrets.sh

TF_VAR_ENV=$1 terragrunt $2-all

exit $status
