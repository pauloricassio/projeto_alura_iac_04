resource "aws_security_group" "acesso_geral" {
    name = "acesso_geral"
    description = "grupo_Dev"
    ingress{
        cidr_blocks = ["189.124.203.109/32"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    egress{
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"

    }
    tags = {
      Name = "acesso_geral"  
    }
}