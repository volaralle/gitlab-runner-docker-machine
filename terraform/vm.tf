resource "yandex_compute_instance" "vm-1" {
name = var.vm_yc_name
allow_stopping_for_update = true
metadata = {
  ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

resources {
    cores  = var.cores
    memory = var.ram
 }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.size_vm
  }
 }

  network_interface {
    subnet_id = var.subnet_id
    nat       = false
    ip_address = var.ip_address
    security_group_ids = ["${yandex_vpc_security_group.gitlab_sg.id}"]
}

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = yandex_compute_instance.vm-1.network_interface.0.ip_address
    #yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
  }

 provisioner "file" {
    source      = "../files/authorized_keys"
    destination = "/home/ubuntu/authorized_keys"
  }

  provisioner "file" {
     source      = "./key.json"
     destination = "/home/ubuntu/key.json"
   }
  
 provisioner "remote-exec" {
   inline = ["sudo cat /home/ubuntu/authorized_keys >> /home/ubuntu/.ssh/authorized_keys"]
     }
}
