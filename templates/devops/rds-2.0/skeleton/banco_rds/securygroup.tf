resource "aws_security_group" "prod-rds-instance" {
  vpc_id      = aws_db_subnet_group.postgres-subnet.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
  tags = {
    Name = "rds-instance"
  }
}

resource "aws_security_group" "allow-postgres" {
  vpc_id      = aws_db_subnet_group.postgres-subnet.id
  name        = "allow-postgresl"
  description = "allow-postgresl"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = var.resource_tags
}
