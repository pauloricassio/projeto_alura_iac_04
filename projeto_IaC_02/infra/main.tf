terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

#Provedor cloud AWS:

provider "aws" {
  profile = "default"
  region = var.regiao_aws
}

#Recurso para template de criação de servidores:

resource "aws_launch_template" "servidores" {
  image_id      = var.amis
  instance_type = var.instancia
  key_name = var.chave
  tags = {
    Name = "Terraform Ansible Python"
  }
  security_group_names = [ var.grupo_seguranca ]
  user_data = var.producao ? filebase64("ansible.sh") : ""
}

#Recurso para criação e importação de chave SSH para AWS:

resource "aws_key_pair" "chaveSSH" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
}

#Recurso para criação de autoscaling: 

resource "aws_autoscaling_group" "grupo_autoscaling" {
  availability_zones = [ "${var.regiao_aws}a", "${var.regiao_aws}b" ] 
  name = var.grupo_autoscaling
  max_size = var.maximo
  min_size = var.minimo
  launch_template {
    id = aws_launch_template.servidores.id
    version = "$Latest"
  }
  target_group_arns = var.producao ? [ aws_lb_target_group.target_group[0].arn ] : [ ]
}

#Recurso para definição de subnetes:

resource "aws_default_subnet" "subnet_1" {
  availability_zone = "${var.regiao_aws}a"
  tags = {
    Name = "${var.subnet_1}"
  }
}

resource "aws_default_subnet" "subnet_2" {
  availability_zone = "${var.regiao_aws}b"
  tags = {
    Name = "${var.subnet_2}"
  }
}

#Recurso para criação de loadbalancer:

resource "aws_lb" "loadbalancer" {
  name = var.loadbalancer
  internal = false
  subnets = [ aws_default_subnet.subnet_1.id, aws_default_subnet.subnet_2.id ]
  count = var.producao ? 1 : 0
}

#Recurso para definir o grupo alvo do load balancer:

resource "aws_lb_target_group" "target_group" {
  name     = var.target_group
  port     = "8000"
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
  count = var.producao ? 1 : 0
}

#Recurso para definir a VPC que será usada:

resource "aws_default_vpc" "default" {

}

#Recurso para definir o "listener" do load balancer:

resource "aws_lb_listener" "entry_lb" {
  load_balancer_arn = aws_lb.loadbalancer[0].arn
  port = "8000"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_group[0].arn
  }
  count = var.producao ? 1 : 0
}

resource "aws_autoscaling_policy" "escala-Producao" {
  name = var.terraform-escala
  autoscaling_group_name = var.grupo_autoscaling
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
  count = var.producao ? 1 : 0 
}
