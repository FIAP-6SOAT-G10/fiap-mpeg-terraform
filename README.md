# FIAP Fast Food EKS Deployment

Este projeto configura e implanta um cluster EKS na AWS usando Terraform. Ele inclui a configuração de sub-redes, balanceadores de carga, grupos de segurança, e outros recursos necessários para rodar um aplicativo de fast food.

## Estrutura do Projeto

- `data.tf`: Define as zonas de disponibilidade e políticas IAM.
- `ecr.tf`: Configura o repositório ECR para armazenar imagens Docker.
- `eks.tf`: Configura o cluster EKS e os grupos de nós.
- `ig.tf`: Configura o Internet Gateway.
- `output.tf`: Define as saídas do Terraform.
- `subnet.tf`: Configura as sub-redes públicas e privadas.
- `variables.tf`: Define as variáveis usadas no projeto.
- `versions.tf`: Especifica a versão do Terraform e dos provedores.
- `vpc.tf`: Configura a VPC e as tabelas de rotas.
- `.github/workflows/deploy.yaml`: Configura o GitHub Actions para implantar a infraestrutura.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) v1.0.0 ou superior
- AWS CLI configurado
- Credenciais AWS com permissões adequadas

## Configuração

1. Clone o repositório:
    ```sh
    git clone https://github.com/sourceGabriel/fiap-fast-food-eks.git
    cd fiap-fast-food-eks
    ```

2. Inicialize o Terraform:
    ```sh
    terraform init
    ```

3. Crie um plano de execução:
    ```sh
    terraform plan -out=tfplan
    ```

4. Aplique o plano:
    ```sh
    terraform apply tfplan
    ```

## Estrutura do Cluster

- **VPC**: Uma VPC com sub-redes públicas e privadas.
- **EKS**: Um cluster EKS com grupos de nós públicos.
- **ECR**: Um repositório ECR para armazenar imagens Docker.
- **NLB**: Um Network Load Balancer para expor o serviço na internet.

## Variáveis

As variáveis estão definidas no arquivo `variables.tf`. Você pode sobrescrever essas variáveis criando um arquivo `terraform.tfvars`.

## Saídas

As saídas do Terraform estão definidas no arquivo `output.tf` e incluem o endpoint do EKS, o ID do repositório ECR, e a URL do repositório ECR.

## CI/CD

O projeto inclui um pipeline de CI/CD configurado com GitHub Actions (`.github/workflows/deploy.yaml`). Ele executa os seguintes passos:

- Configura as credenciais AWS
- Inicializa o Terraform
- Executa `terraform plan`
- Executa `terraform apply` ou `terraform destroy` baseado na variável `DESTROY`

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
