#!/bin/bash

# Verifica se la variabile d'ambiente $TERRAFORM_TOKEN è impostata
if [ -z "$TERRAFORM_TOKEN" ]; then
  echo "La variabile d'ambiente \$TERRAFORM_TOKEN non è impostata. Assicurati di averla definita con il tuo token."
  exit 1
fi

# Percorso della directory .terraform.d
dir_path="/home/gitpod/.terraform.d/"
# Percorso del file credentials.tfrc.json
file_path="${dir_path}credentials.tfrc.json"

# Crea la directory se non esiste
mkdir -p "$dir_path"

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

# Notifica l'avvenuta creazione del file
echo "File $file_path creato con successo. Contenuto:"
cat "$file_path"
