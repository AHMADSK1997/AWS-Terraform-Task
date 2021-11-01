variable "instance_name_tag" {
    type = string
    default = "Terraform"
    description = "The Value of the Name Tag; default is 'Terraform' "
}

variable "instance_ami" {
    type = string
    description = "The AMI To be used to create the instance" 
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "The instance to be created; Default is t2.micro"
}

variable "instance_key" {
    type = string
    default = "ahmad-vpc-key"
    description = "The SSH Key Name to attach to the new instance; default is 'ahmad-vpc-key"
}