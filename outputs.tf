# updated output latest
output "my_vpc_id" {
    value = aws_vpc.main_vpc.id
}

output "public_subnet_a_id" {
    value = aws_subnet.public_a.id
}

output "private_subnet_a_id" {
    value = aws_subnet.private_a.id
}

output "public_to_internet_rt_id" {
    value = aws_route_table.public_to_internet_rt.id
}
output "private_to_public_subnet_rt_id" {
    value = aws_route_table.private_to_public_subnet_rt.id
}
