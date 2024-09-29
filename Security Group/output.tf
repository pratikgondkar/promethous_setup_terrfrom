output "aws_SG_public_id" {
  value = aws_security_group.SG-01.id
}

output "aws_SG_private_id" {
  value = aws_security_group.SG-02.id
}