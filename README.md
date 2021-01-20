# selkov_infra
selkov Infra repository

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
