module "aws-dev" {
    source = "../../infra"
    instancia = "t2.micro"
    regiao_aws = "us-east-2"
    chave = "Iac-DEV"
    amis = "ami-0aeb7c931a5a61206"
    grupo_seguranca = "DEV"
}

output "IP" {
  value = module.aws-dev.IP_Publico
  
}