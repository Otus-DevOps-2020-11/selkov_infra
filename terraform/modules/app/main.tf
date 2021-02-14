resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    private_key = file(var.private_key_path)
  }

#  Option 1
#  provisioner "local-exec" {
#    command = "sed 's/DB_IP/${var.db_ip}/g' ${path.module}/files/puma.service.tpl > ${path.module}/files/puma.service"
#  }

  provisioner "file" {
#  Option 2
    content     = templatefile("${path.module}/files/puma.service", {
      db_ip = var.db_ip
    })
#  Option 1
#    source      = "${path.module}/files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/deploy.sh"
  }
}
