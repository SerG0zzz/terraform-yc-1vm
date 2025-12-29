# Всегда создаём сеть. Если она уже есть - Terraform это увидит и ничего не изменит
resource "yandex_vpc_network" "network" {
  name = "develop"
}

# Всегда создаём подсеть. Если уже есть - Terraform просто проигнорирует создание
resource "yandex_vpc_subnet" "subnet" {
  name           = "develop-ru-central1-a"
  zone           = var.yc_default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

# Получаем ID образа Ubuntu
data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-2204-lts"
}

# Создаём виртуальную машину
resource "yandex_compute_instance" "vm" {
  name        = "ubuntu-vm"
  platform_id = "standard-v3"
  zone        = var.yc_default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.vm_user}:${file(var.vm_ssh_public_key_path)}"
  }
}

# 5. Выводы
output "vm_external_ip" {
  value       = yandex_compute_instance.vm.network_interface.0.nat_ip_address
  description = "Внешний IP-адрес ВМ"
}

output "ssh_connection_command" {
  value       = "ssh -i ~/.ssh/id_ed25519 ubuntu@${yandex_compute_instance.vm.network_interface.0.nat_ip_address}"
  description = "Команда для подключения по SSH"
}
