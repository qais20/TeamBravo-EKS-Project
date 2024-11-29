output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.eks_vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = [aws_subnet.public.id, aws_subnet.public2.id]
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = [aws_subnet.private.id]
}

output "security_group_ids" {
  description = "List of security group IDs"
  value       = [aws_security_group.for_eks.id, aws_security_group.tm_sg.id] 
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway"
  value       = aws_nat_gateway.nat_gw.id
}

output "public_route_table_id" {
  description = "Route table ID for the public subnet"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "Route table ID for the private subnet"
  value       = aws_route_table.private.id
}

output "public_subnet2_ids" {
  description = "IDs of the second public subnet"
  value       = [aws_subnet.public2.id] 
}

