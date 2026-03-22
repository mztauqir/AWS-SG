resource "aws_security_group" "this" {
  description = "Security-group"
  name        = var.name
  vpc_id      = var.vpc_id

  ingress {
    description = "Security-group-rule"
    from_port   = 5444
    to_port     = 5444
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"]

  }

ingress {
  description = "Allow SSH from internal network"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
    description = "Allow-authorized-networks-SSL-connectivity-into-vpc-endpoint-interface"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "10.59.131.32/27",
      "10.59.129.160/27",
      "10.59.130.128/27",
      "10.59.144.240/28",
      "10.59.144.80/28",
      "10.59.144.208/28",
      "0.0.0.0/0"
    ]
  }

  egress {
    description = "Security-group-rule"
    from_port   = 5444
    to_port     = 5444
    protocol    = "tcp"
    cidr_blocks = []
    self        = true
  }

  egress {
    description = "On-PREM-Postgres-subnets"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      "10.2.1.0/24",
      "10.13.102.0/24",
      "10.13.144.0/22",
      "10.13.108.0/22",
      "10.2.40.0/22",
      "10.23.64.0/22"
    ]
  }
}
