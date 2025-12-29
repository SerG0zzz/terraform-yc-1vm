# terraform-yc-1vm

Создание 1 ВМ в яндекс облаке.
В *terraform.tfvars* нужно задать 3 переменных:
 - yc_token - OAuth-токен
 - yc_cloud_id - ид клоуда
 - yc_folder_id - ид директории

Данный файл в репозиторий не включён по соображениям безопасности.

# Запуск 
Нужно выполнить `terraform init` и `terrafom plan` в итоге получится такой вывод:

<img width="540" height="554" alt="image" src="https://github.com/user-attachments/assets/73e97f69-5e81-4ad9-8098-fb43338151ba" />

# Исполнение
Нужно выполнить `terraform apply`, получим в выводе ip удалёной ВМ и
сразу готовую команду подключения к ВМ (предварительно используется публичный ключ), 
лежащий в `~/.ssh/id_ed25519.pub`.

<img width="680" height="378" alt="image" src="https://github.com/user-attachments/assets/057992e2-3c42-4bec-b8c8-0c058e3d4f8c" />

# Подключение
Используем полученную команду из вывода и успешно подключаемся по ssh к ВМ в облаке.

<img width="675" height="607" alt="image" src="https://github.com/user-attachments/assets/ae440167-650e-44d2-a1f0-d14ffdcfac24" />

