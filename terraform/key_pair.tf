resource "tls_private_key" "private_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "public_key" {
  key_name   = "key-pair"
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "null_resource" "out" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<EOF
      echo '${tls_private_key.private_key.private_key_pem}' > $HOME/.ssh/mykey.pem && chmod 400  $HOME/.ssh/mykey.pem
    EOF
  }
}

resource "local_file" "private_key" {
  depends_on = [
    tls_private_key.private_key,
  ]
  content  = tls_private_key.private_key.private_key_pem
  filename = "key-pair.pem"

}
