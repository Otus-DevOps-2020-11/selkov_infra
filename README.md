# selkov_infra
selkov Infra repository

# Lecture 9. Homework 7
### Данные для подключения
testapp_IP = 84.252.130.80<br/>
testapp_port = 9292

### Проверка работы
http://84.252.130.80:9292

### Что сделано
- Структурированы ресурсы, app и db вынесены на отдельные инстансы.<br/>
Создан образ app [app.json](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/packer/app.json).<br/>
Создан образ db [db.json](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/packer/db.json).<br/>
Созданы конфигурационные файлы для app (app.tf) и db (db.tf).<br/>
Остальную концигурацию нашей инфраструктуры разбили по отдельным файлам.<br/>
- Созданы модули, вся работа по созданию, настройке и деплою вынесена по отдельным модулям app [/modules/app](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/terraform/modules/app/) и db [/modules/db](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/terraform/modules/db/).
- Создали инфраструктуру для двух окружений stage [/stage](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/terraform/stage/) и prod [/prod](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/terraform/prod/), используя созданные модули.

### Задание с *
- Настроено хранение стейт файла [terraform-prod.tfstate](https://storage.yandexcloud.net/reddit-app-states/terraform-prod.tfstate?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=I89EjR7hpjWoYGE7xm7A%2F20210212%2Fru-central1%2Fs3%2Faws4_request&X-Amz-Date=20210212T213638Z&X-Amz-Expires=604800&X-Amz-Signature=14105b73c127580c38e35dc6a8b80da40e8ddb0824e8197b8056906cdea27f3e&X-Amz-SignedHeaders=host) в удаленном бекенде.
- Описан бекенд [backend.tf](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-2/terraform/prod/backend.tf).

### Задание с **
- Добавлены необходимые provisioner в модули для деплоя и работы приложения.
- Сделано получение приложением адреса БД из переменной окружения DATABASE_URL с помощью templatefile.

<br/>

# Lecture 8. Homework 6
### Данные для подключения
testapp_IP = 84.201.133.178
testapp_port = 80

### Проверка работы
http://84.201.133.178

### Что сделано
- Запуск VM при помощи terraform
[main.tf](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/main.tf)
- Выходные переменные
[outputs.tf](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/outputs.tf)
- Добавление провижинеров
[puma.service](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/files/puma.service)
[deploy.sh](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/files/deploy.sh)
- Параметризирование конфигурационных файлов
[variables.tf](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/variables.tf)
- Определение переменных
[terraform.tfvars](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/terraform.tfvars.example)

### Задание с **
- HTTP Load Balancer
[lb.tf](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/terraform-1/terraform/lb.tf)
- В terraform ресурсе задано количество инстансов через параметр ресурса count
- Проблема в том, что созданная конфигурация - два разных приложения с двумя отдельными БД
<br/>

# Lecture 7. Homework 5
### Данные для подключения
testapp_IP = 178.154.253.201<br/>
testapp_port = 9292

### Проверка работы
http://178.154.253.201:9292

### Что сделано
- Создан Packer template и параметризирован
[ubuntu16.json](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/packer-base/packer/ubuntu16.json)
-  Определены пользовательские переменные в отдельный файл
[variables.json.example](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/packer-base/packer/variables.json.example)

### Дополнительное задание 1
“Запечены” (bake) в image VM все зависимости приложения и сам код приложения
- Шаблон, в котором два скрипта: [immutable.json](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/packer-base/packer/immutable.json)
- Скрипт установки и запуска, с использованием systemd для управление юнитом, для запуска кода приложения: [startup_script.sh](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/packer-base/packer/files/startup_script.sh)
- Сервис юнит-файл: [puma.service](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/packer-base/packer/files/reddit.service)

## Дополнительное задание 2
Создан shell-скрипт для создания VM из собранного образа:
[create-redditvm.sh](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/packer-base/config-scripts/create-redditvm.sh)
<br/>

# Lecture 6. Homework 4
### Данные для подключения
testapp_IP = 84.201.129.131<br/>
testapp_port = 9292

### Проверка работы
http://84.201.129.131:9292/

### Дополнительное задание
- Скрипт создания VM с запущенным приложением [startup.sh](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/cloud-testapp/startup.sh)
- Скрипт запускаемый при создании инстанса [metadata.yaml](https://github.com/Otus-DevOps-2020-11/selkov_infra/blob/cloud-testapp/metadata.yaml)
<br/>

# Lecture 5. Homework 3
## Данные для подключения
bastion_IP = 178.154.229.7
someinternalhost_IP = 10.128.0.8

## Конфигурация
Два экземпляра VM:
- bastion
- someinternalhost (без внешней сети)

Bastion host используется для сквозного подключения. На нем установлен VPN Pritunl, использующий порт udp 11344.

## Проверка работы
Панель управления Pritunl:
https://178.154.229.7
Login: pritunl
Password: slack - #alexei.selkov

Подключение к VPN-серверу:
Установить VPN-клиент: https://client.pritunl.com/
Username: test
PIN: slack - #alexei.selkov
Подключение к VPN-серверу bastion осуществляется с использованием конфигурационного файла cloud-bastion.ovpn

## Дополнительные задания
1.1 ssh -A -tt appuser@178.154.229.7 ssh -tt 10.128.0.8

1.2 ssh someinternalhost
~/.ssh/config
Host someinternalhost
    HostName 10.128.0.8
    ProxyJump appuser@178.154.229.7
    User appuser

2. https://178.154.229.7.sslip.io
