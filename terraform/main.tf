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

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name

  records = [
    {
      name    = "mongodb"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mongodb.private_ip}",
      ]
    },
    {
      name    = "redis"
      type    = "A"
      ttl     = 1
      records = [
        "${module.redis.private_ip}",
      ]
    },
    {
      name    = "mysql"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mysql.private_ip}",
      ]
    },
    {
      name    = "rabbitmq"
      type    = "A"
      ttl     = 1
      records = [
        "${module.rabbitmq.private_ip}",
      ]
    },
    {
      name    = "catalogue"
      type    = "A"
      ttl     = 1
      records = [
        "${module.catalogue.private_ip}",
      ]
    },
    {
      name    = "user"
      type    = "A"
      ttl     = 1
      records = [
        "${module.user.private_ip}",
      ]
    },
    {
      name    = "cart"
      type    = "A"
      ttl     = 1
      records = [
        "${module.cart.private_ip}",
      ]
    },
    {
      name    = "shipping"
      type    = "A"
      ttl     = 1
      records = [
        "${module.shipping.private_ip}",
      ]
    },
    {
      name    = "payment"
      type    = "A"
      ttl     = 1
      records = [
        "${module.payment.private_ip}",
      ]
    },
    {
      name    = "dispatch"
      type    = "A"
      ttl     = 1
      records = [
        "${module.dispatch.private_ip}",
      ]
    },
    {
      name    = "web"
      type    = "A"
      ttl     = 1
      records = [
        "${module.web.private_ip}",
      ]
    },
  ]
}
