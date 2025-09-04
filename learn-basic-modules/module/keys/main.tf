resource "tls_private_key" "this1key" {
  algorithm = "RSA"
   rsa_bits  = 4096
}

resource "aws_key_pair" "this1key1" {
    key_name   = var.key_name
    public_key = tls_private_key.this1key.public_key_openssh
}

resource "local_file" "this1key1" {
  filename = "${var.key_name}.pem"
  content = tls_private_key.this1key.private_key_pem
}