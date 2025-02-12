# VPC
variable "vpc_cidr" {
    description = "The CIDR of my VPC"
    type = string
}

variable "ec2created" {
    description = "shall module create ec2?"
    type = bool
    default = false
}

variable "region" {
    description = "Default region for our VPC"
    type = string
}

variable "vpc_name" {
    description = "The Name of my VPC"
    type = string
}

# INTERNET GATEWAY
variable "internet_gw_name" {
    description = "The Name of my Internet Gatewat"
    type = string
}

# SUBNET
# PUBLIC
variable "public_a_cidr" {
    description = "CIDR of the public Subnet in AZ A"
    type = string
}

# variable "public_b_cidr" {
#     description = "CIDR of the public Subnet in AZ B"
#     type = string
# }

# variable "public_c_cidr" {
#     description = "CIDR of the public Subnet in AZ C"
#     type = string
# }

# PRIVATE
variable "private_a_cidr" {
    description = "CIDR of the private Subnet in AZ A"
    type = string
}
