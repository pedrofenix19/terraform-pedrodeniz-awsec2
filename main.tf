resource "aws_instance" "ec2_instance" {
  count = var.environment == "dev" ? 1 : length(var.subnet_ids) * var.instances_per_subnet

  # ami           = "ami-0ebfd941bbafe70c6" #AZ2023 en us-east-1
  ami           = var.ami
  instance_type = "t2.micro"
  # subnet_id     = var.environment == "dev" ? var.subnet_ids[0] : element(var.subnet_ids, floor(count.index / var.instances_per_subnet))
  subnet_id     = var.environment == "dev" ? var.subnet_ids[0] : var.subnet_ids[floor(count.index / var.instances_per_subnet)]
  
  tags = {
    Name = "${var.instance_name_prefix}-instance-${count.index}"
  }
}