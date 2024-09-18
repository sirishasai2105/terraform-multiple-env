variable "instances" {
    type = map
}

variable "environment" {
    type = string
}

variable "sg" {
    default = "security_group"
}

variable domain_name {
    type = string
    default = "reyanshsai.online"
}