# Sample tfvars file
access_key = "AKIA324W22XTNQUG2VXN"
secret_key = "CVv4EtguHivDFoGt0CHmL7IOqKhapk+MZEJerB0e"

# Number of web servers (Load balancer will automatically manage target groups)
web_number = "2"

web_ami             = "ami-0ec0b3eb271f5afbc"
web_instance_type   = "t2.micro"
public_keypair_path = "<path to public key pair>"

#Database Information (wordpress containe will use wordpress database by default)

db_user     = "admin"
db_password = "gogreen123"




