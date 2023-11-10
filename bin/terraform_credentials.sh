#!/bin/bash

# Verifica se la variabile d'ambiente $TERRAFORM_TOKEN è impostata
if [ -z "$TERRAFORM_TOKEN" ]; then
  echo "La variabile d'ambiente \$TERRAFORM_TOKEN non è impostata. Assicurati di averla definita con il tuo token."
  exit 1
fi

# Percorso del file credentials.tfrc.json
file_path="/home/gitpod/.terraform.d/credentials.tfrc.json"

# Crea il contenuto del file JSON
json_content=$(cat <<EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TERRAFORM_TOKEN"
    }
  }
}
EOF
)

# Scrivi il contenuto nel file
echo "$json_content" > "$file_path"
