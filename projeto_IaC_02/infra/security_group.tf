resource "aws_security_group" "acesso" {
    name = var.grupo_seguranca
    description = "grupo de seguranca para restricao de acesso"
    ingress{
        description = "Acesso Entrada"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }

    egress{
        description = "Acesso Saida"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"

    }
    tags = {
      Name = "acesso"  
    }
}