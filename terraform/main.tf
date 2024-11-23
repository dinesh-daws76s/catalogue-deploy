module "catalogue" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops-practice.id
  name                   = "${local.ec2_name}-catalogue"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
  subnet_id              = local.private_subnet_ids
  tags = merge(
    var.common_tags,
    {
      Component = "catalogue"
    },
    {
      Name = "${local.ec2_name}-catalogue"
    }
  )
}

module "ansible" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops-practice.id
  name                   = "${local.ec2_name}-ansible"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.openvpn_sg_id.value]
  subnet_id              = data.aws_subnet.selected.id  #  default VPC 1a subnet
  user_data = file("ec2-provision.sh")
  tags = merge(
    var.common_tags,
    {
      Component = "ansible"
    },
    {
      Name = "${local.ec2_name}-ansible"
    }
  )
}
