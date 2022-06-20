module "aws-prod" {
    source = "../../infra"
    instancia = "t2.nano"
    regiao_aws = "us-east-1"
    chave = "IaC-PROD"
    amis = "ami-09d56f8956ab235b3"
    grupo_seguranca = "gs-producao"
    grupo_autoscaling = "at-producao"
    minimo = 1
    maximo = 10
    vpc = "Rede-Producao"
    loadbalancer = "lb-producao"
    target_group = "tg-producao"
    subnet_1 = "subnet-producao-1"
    subnet_2 = "subnet-producao-2"
    terraform-escala = "tf-escala"
    producao = true
}