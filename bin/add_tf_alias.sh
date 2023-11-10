#!/bin/bash

# Definisci l'alias per Terraform
terraform_alias="alias tf='terraform'"

# Aggiungi l'alias al file ~/.bash_profile se non esiste già
if ! grep -qxF "$terraform_alias" ~/.bash_profile; then
  echo -e "\n$terraform_alias" >> ~/.bash_profile
  echo "Alias aggiunto a ~/.bash_profile."
else
  echo "L'alias tf='terraform' è già presente in ~/.bash_profile."
fi

# Applica le modifiche immediatamente
source ~/.bash_profile
