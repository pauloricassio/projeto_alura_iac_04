module "producao" {
    source = "../../infra"

    nome = "producao"
    regiao_aws = "us-east-1"
    cargoIAM = "producao"
    ambiente = "producao"

}

output "IP_alb" {
    value = module.producao.IP
}