output "instance_one_id" {
  value = aws_instance.instance["one"].id
}
output "instance_two_id" {
  value = aws_instance.instance["two"].id
}
output "security_group_id" {
  value = aws_security_group.allow_tls.id
}