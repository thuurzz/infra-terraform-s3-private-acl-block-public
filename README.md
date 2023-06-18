# Criando bucket privado para assets na AWS

Este projeto tem como objetivo criar um bucket S3 privado na AWS para armazenar assets de forma segura.

## Pré-requisitos

Antes de usar este projeto, você precisará ter os seguintes requisitos atendidos:

- Ter uma conta na AWS com as credenciais de acesso configuradas.
- Ter o Terraform instalado em sua máquina local.

## Configuração

Siga as etapas abaixo para configurar e usar o projeto:

1. Clone este repositório em sua máquina local.
2. Navegue até o diretório do projeto.
3. Crie um arquivo de variáveis no formato tfvars, por exemplo dev.tfvar, e defina os valores das variáveis necessárias. Consulte o arquivo variables.tf para obter uma lista das variáveis disponíveis.
4. Execute o comando terraform init para inicializar o diretório do projeto.
5. Execute o comando terraform plan -var-file="dev.tfvar" para visualizar o plano de execução e verificar se não há erros.
6. Execute o comando terraform apply -var-file="dev.tfvar" para criar o bucket S3 privado.

## Como usar o projeto

Para criar o bucket S3 privado, execute o seguinte comando no diretório do projeto:

```sh
terraform apply -var-file="nome-do-ambiente.tfvar"
```

Após a execução bem-sucedida, o bucket S3 privado será criado na sua conta da AWS.

## Limpeza

Se você quiser remover todos os recursos criados pelo projeto, execute o seguinte comando no diretório do projeto:

```sh
terraform destroy -var-file="nome-do-ambiente.tfvar"
```

Este comando irá destruir e remover o bucket S3 privado e quaisquer outros recursos criados.

## Contribuindo

Se você deseja contribuir com melhorias para este projeto, fique à vontade para enviar pull requests ou abrir issues relatando problemas ou sugestões.

## Licença

Este projeto está licenciado sob a MIT License.
