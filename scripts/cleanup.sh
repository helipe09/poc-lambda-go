#!/bin/bash
set -e

echo "Iniciando limpeza de recursos AWS..."

echo "Destruindo recursos provisionados pelo Terraform..."
cd "$(dirname "$0")/../terraform"
terraform init
terraform destroy -auto-approve

echo "Removendo arquivos de build locais..."
cd ..
rm -rf bin

echo "Limpeza concluída com sucesso!"
