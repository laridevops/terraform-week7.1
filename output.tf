output "public-ip" {
    value = aws_instance.my_instance[0].public_ip
}

output "splungsg-id" {
    value = aws_security_group.my_sg.id
}

output "vpc1-id" {
    value = aws_vpc.vpc1.id
}