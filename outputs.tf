output "instance_ids" {
  value = resource.aws_instance.ec2_instance[*].id
}