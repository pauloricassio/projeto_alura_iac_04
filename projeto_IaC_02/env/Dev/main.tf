module "aws-dev" {
    source = "../../infra"
    instancia = "t2.micro"
    regiao_aws = "us-east-2"
    chave = "Iac-DEV"
    amis = "ami-0aeb7c931a5a61206"
    grupo_seguranca = "DEV"
    grupo_autoscaling = "at-desenvolvimento"
    minimo = 0
    maximo = 1
    vpc = "Rede-Desenvolvimento"
    loadbalancer = "lb-desenvolvimento"
    target_group = "tg-desenvolvimento"
    subnet_1 = "subnet-desenvolvimento-1"
    subnet_2 = "subnet-desenvolvimento-2"
    terraform-escala = "tf-escala"
    producao = false
}