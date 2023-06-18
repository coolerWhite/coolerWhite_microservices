terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = "y0_AgAAAAAGSkciAATuwQAAAADdNLrY_0Khq-URTsm09HG0_paekMdljFQ"
  cloud_id = "b1g7l74lnn6rclqqjmol"
  folder_id = "b1g48emueni74b1dvtn3"
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "docker" {
  name = "docker-host"

  resources {
    cores = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd83vhe8fsr4pe98v6oj"
      size = 15
    }
  }

  network_interface {
    subnet_id = "e9bg4jvgvedi3j7jhecv"
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