module "aws-prod" {
    source = "../../infra"
    instancia = "t2.nano"
    regiao_aws = "us-east-1"
    chave = "IaC-PROD"
    amis = "ami-09d56f8956ab235b3"
    grupo_seguranca = "GS-Producao"
    grupo_autoscaling = "AT-Producao"
    minimo = 1
    maximo = 10
    vpc = "Rede-Producao"
    loadbalancer = "LB-producao"
    target_group = "TG-producao"
    subnet_1 = "Subnet-producao-1"
    subnet_2 = "Subnet-producao-2"
}