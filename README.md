# Projeto Lambda em Go com Terraform e GitHub Actions

Este projeto contém uma função AWS Lambda escrita em Go, que é implantada usando Terraform e automatizada com GitHub Actions.

## Estrutura do Projeto

```
poc-lambda-go
├── .github
│   └── workflows
│       └── deploy.yml
├── src
│   └── main.go
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
├── scripts
│   └── build.sh
├── go.mod
├── go.sum
├── Makefile
└── README.md
```

## Pré-requisitos

- Go (versão 1.16 ou superior)
- Terraform (versão 1.0 ou superior)
- Conta na AWS com permissões para criar funções Lambda e outros recursos necessários
- GitHub para CI/CD

## Configuração

1. Clone o repositório:

   ```
   git clone <URL_DO_REPOSITORIO>
   cd poc-lambda-go
   ```

2. Instale as dependências do Go:

   ```
   go mod tidy
   ```

3. Configure suas credenciais da AWS. Você pode fazer isso através do arquivo `~/.aws/credentials` ou usando variáveis de ambiente.

## Compilação

Para compilar a função Lambda, execute o script de build:

```
bash scripts/build.sh
```

## Deploy

O deploy da função Lambda é realizado através do GitHub Actions. Quando você fizer push para a branch principal, o fluxo de trabalho definido em `.github/workflows/deploy.yml` será acionado, e o Terraform será utilizado para implantar a função.

## Estrutura do Terraform

- `main.tf`: Define os recursos da AWS, incluindo a função Lambda.
- `variables.tf`: Define variáveis para personalizar a configuração do Terraform.
- `outputs.tf`: Define as saídas do Terraform, como o ARN da função Lambda.
- `provider.tf`: Configura o provedor AWS.

## Limpeza

Para remover os recursos criados pelo Terraform, execute o comando:

```
terraform destroy
```

## Contribuição

Sinta-se à vontade para contribuir com melhorias ou correções. Faça um fork do repositório, crie uma branch para suas alterações e envie um pull request.

## Licença

Este projeto está licenciado sob a MIT License - consulte o arquivo LICENSE para mais detalhes.
