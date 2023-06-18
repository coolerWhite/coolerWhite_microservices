terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = ""
  cloud_id = ""
  folder_id = ""
  zone = ""
}

resource "yandex_compute_instance" "docker" {
  name = "docker-host"

  resources {
    cores = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = ""
      size = 15
    }
  }

  network_interface {
    subnet_id = ""
    ipv4 = true
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/home/otus/.ssh/ubuntu.pub")}"
  }

  connection {
    type = "ssh"
    host = yandex_compute_instance.docker.network_interface.0.nat_ip_address
    user = "ubuntu"
    agent = false
    private_key = file("/home/otus/.ssh/ubuntu")
  }

}
