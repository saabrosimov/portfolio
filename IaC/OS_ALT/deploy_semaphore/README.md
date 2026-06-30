#RoadMap

[Используется модуль alt_rpm, который по умолчанию зашит в ОС](https://www.altlinux.org/Ansible)

[перечень ключей для модуля, по ссылке](https://docs.ansible.com/projects/ansible/latest/collections/community/general/apt_rpm_module.html)

[Видеообзор ПО](https://rutube.ru/video/da615045dc1a6263bf7d34a0dc29ddd6/?utm_source=embed&utm_medium=referral&utm_campaign=logo&utm_content=da615045dc1a6263bf7d34a0dc29ddd6&utm_term=yastatic.net&t=55)



Задачу делим на несколько плейбуков (на случай, если нам нужна только часть для референса). 

`Nginx выносим отдельно, для указания доменного имени и указания сертифика.`


`СУБД выносим отдельно, для отработки развертывания на ОС АЛЬТ и последущего референса.`

*Некоторые данные намеренно изменены или удалены

Структура каталогов:

```
.
├── deploy_host_include.yml    # cценарий общего запуска;
├── files
│   ├── certs                  # SSL сертификаты;
│   │   ├── fullchain.pem
│   │   └── privkey.pem
│   │
│   └── tofurc
├── group_vars
│   └── all.yml                # общие переменные;
├── inventory.ini
├── playbooks
│   ├── container_install.yml  # сцанарий установки Docker;
│   ├── iac_install.yml        # сценарий установки Ansible_or_others;
│   ├── ntp.yml                # сценарий настройки времени сервера;
│   ├── openstackclient.yml    # сценарий установки OpenStack(без настройки);
│   ├── others_packages.yml    # cценарий установки тестовых пакетов (для отработки);
│   ├── semaphore_install.yml  # сценарий установки ПО;
│   └── update_install.yml     # сценарий обновления системы;
├── README.md                  # описание;
├── templates
│   ├── chrony.conf.j2         # шаблон настройки ntp;
│   ├── docker-compose.yml.j2  # шаблон параметров ПО;
│   ├── nginx.conf.j2          # шаблон веб-интерфейса;
│   ├── pg_hba.conf.j2         # шаблон настройки СУБД;
│   └── postgresql.conf.j2     # шаблон настройки СУБД;
├── terraform.tfstate
└── tofu
├── credentials.auto.tfvars    # параметры обвязки гипервизора;
├── deploy-host.tf             # шаблон хостов;
├── generate-inventory.tf
├── main.tf                    # настройки плагина гипервизора;
├── terraform.tfstate          
├── terraform.tfstate.backup
└── vars.tf                    # параметры для развертывания стендов;

```
