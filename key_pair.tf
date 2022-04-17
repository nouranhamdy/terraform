resource "tls_private_key" "private_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "public_key" {
  key_name   = "key-pair-02"
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "local_file" "private_key" {
  depends_on = [
    tls_private_key.private_key,
  ]
  content  = tls_private_key.private_key.private_key_pem
  filename = "key-pair-02.pem"

}
