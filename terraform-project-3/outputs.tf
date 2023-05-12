output "instance_id" {
 value = aws_instance.raes_instance.id 
}

output "instance_type" {
  value =  var.instance_type
}

output "public_subnet_ids" {
    value = [
        aws_subnet.raes_pub_subnet1.id,
       aws_subnet.raes_pub_subnet2.id
    ]
}

output "private_subnet_ids" {
    value = [
        aws_subnet.raes_priv_subnet1.id,
        aws_subnet.raes_priv_subnet2.id
    ]
}

output "raes_instance_public_ip" {
  value = aws_instance.raes_instance.public_ip
}

output "raes_instance_private_ip" {
  value = aws_instance.raes_instance.private_ip
}

output "raes_instance_security_group_id" {
  value = aws_instance.raes_instance.vpc_security_group_ids
}

