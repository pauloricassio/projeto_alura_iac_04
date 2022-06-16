resource "aws_security_group" "acesso" {
    name = var.grupo_seguranca
    description = "grupo de seguranca para restricao de acesso"
    ingress{
        description = "Acesso SSH"
        cidr_blocks = ["189.124.203.109/32"]
        #ipv6_cidr_blocks = ["::/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress{
        description = "Acesso API"
        cidr_blocks = ["189.124.203.109/32"]
        #ipv6_cidr_blocks = ["::/0"]
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
    }

    egress{
        description = "Acesso Internet"
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