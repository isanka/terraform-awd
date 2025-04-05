output "instance_id" {
  value = aws_instance.main.id
}

output "private_key_pem" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}
