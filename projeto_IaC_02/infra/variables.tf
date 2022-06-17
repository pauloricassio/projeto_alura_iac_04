variable "regiao_aws" {
    type = string
}

variable "chave" {
    type = string
}

variable "instancia" {
    type = string
}

variable "amis" {
    type = string
}

variable "grupo_seguranca" {
    type = string
}

variable "grupo_autoscaling" {
    type = string  
}

variable "minimo" {
    type = number  
}

variable "maximo" {
    type = number  
}

variable "vpc" {
    type = string
  
}

variable "loadbalancer" {
    type = string
}

variable "target_group" {
    type = string
}

variable "subnet_1" {
    type = string
}

variable "subnet_2" {
    type = string
}