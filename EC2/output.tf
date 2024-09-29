output "public_instance_id-01" {
  value = aws_instance.web.id
}

output "private_instance_id-01" {
  value = aws_instance.server_01.id
}

output "private_instance_id-02" {
  value = aws_instance.server_02.id
} 