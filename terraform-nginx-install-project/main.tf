provider "ssh" {
  host     = var.vm_ip
  user     = var.vm_user
  password = var.vm_password
}

resource "null_resource" "install_nginx_remote" {
  connection {
    type     = "ssh"
    host     = var.vm_ip
    user     = var.vm_user
    password = var.vm_password
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y"
    ]
  }
}
