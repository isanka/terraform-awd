output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_key_pem" {
  value     = module.ec2.private_key_pem
  sensitive = true
}
