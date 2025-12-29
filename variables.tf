variable "yc_token" {
  type        = string
  description = "Yandex Cloud OAuth token или IAM-токен сервисного аккаунта"
  sensitive   = true
}

variable "yc_cloud_id" {
  type        = string
  description = "ID облака в Yandex Cloud"
}

variable "yc_folder_id" {
  type        = string
  description = "ID каталога в Yandex Cloud"
}

variable "yc_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности по умолчанию"
}

# Переменные для ВМ
variable "vm_ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "Путь к публичному SSH-ключу для доступа к ВМ"
}

variable "vm_user" {
  type        = string
  default     = "ubuntu"
  description = "Имя пользователя для подключения по SSH"
}
