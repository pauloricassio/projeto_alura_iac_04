module "aws-prod" {
    source = "../../infra"
    instancia = "t2.nano"
    regiao_aws = "us-east-1"
    chave = "IaC-PROD"
    amis = "ami-09d56f8956ab235b3" 
}