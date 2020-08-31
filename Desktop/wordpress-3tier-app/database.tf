# Create db instance 

#make db subnet group 
resource "aws_db_subnet_group" "dbsubnet" {
  name       = "wordpress_db_subnet"
  subnet_ids = [aws_subnet.db_subnet.id]
}

#provision the database
  resource "aws_db_instance" "default" {
  engine         = "mysql"
  allocated_storage  = 20
  engine_version = "5.6.17"
  instance_class = "db.t1.micro"
  name           = "Go_Green_DB"
  username       =  var.db_password
  password       =  var.db_user
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.name
  vpc_security_group_ids = [aws_security_group.db.id]
  }

  provider "mysql" {
  endpoint = "${aws_db_instance.default.endpoint}"
  username = "${aws_db_instance.default.username}"
  password = "${aws_db_instance.default.password}"
}


resource "aws_security_group" "db" {
  name   = "db-secgroup"
  vpc_id = aws_vpc.app_vpc.id

  # ssh access from anywhere
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}