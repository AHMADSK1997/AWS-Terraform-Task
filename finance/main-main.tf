provider "aws" {
  region = "eu-west-1"
}

module "accounting" {
  source = "../modules/Instances"

  instance_name_tag = "finance_acconting"
  instance_ami = "ami-0a8e758f5e873d1c1"
  #instance_type = "t2.micro"
  #availability_zone = "eu-west-1c"
}


output "instance_one_id" {
  value = module.accounting.instance_one_id
}
output "instance_two_id" {
  value = module.accounting.instance_two_id
}
output "security_group_id" {
  value = module.accounting.security_group_id
}
module "target_group_creating" {
  source = "../modules/Target_Group"
  instance_one_id = module.accounting.instance_one_id
  instance_two_id = module.accounting.instance_two_id
}

output "target_group_arn" {
  value = module.target_group_creating.target_group_arn
}
module "load_balancer_creating" {
  source = "../modules/Load_Balancer"
  security_group_id = module.accounting.security_group_id
  target_group_arn = module.target_group_creating.target_group_arn
}
