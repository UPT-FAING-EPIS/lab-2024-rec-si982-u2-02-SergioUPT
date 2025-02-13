provider "aws" {
  region = "us-east-1"
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = "FinancieraApp"
  description = "Aplicación financiera con Blazor Server"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "FinancieraEnv"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2023 v3.3.0 running .NET 8"
}

resource "aws_db_instance" "database" {
  allocated_storage    = 20
  engine              = "mariadb"
  engine_version      = "10.6"
  instance_class      = "db.t3.micro"
  username           = "sqladmin"
  password           = "upt.2025"
  publicly_accessible = true
  skip_final_snapshot = true
}
