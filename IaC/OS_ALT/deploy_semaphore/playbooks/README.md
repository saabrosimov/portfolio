Назначение сценариев:

```
- all.yml  (общие переменные);
- update_install.yml (сценарий обновления системы); 
- ntp.yml (сценарий установки и настройки синхронизации времени); 
- container_install.yml (сценарий развертывания docker); 
- iac_install.yml (сценарий  установки Ansible + Terraform\OpenTofu);
*ставим только .tofurc (зеркало Яндекса), чтобы оно было готово для использования (взять из files/tofurc);
- others_packages.yml (сценарий  остальных пакетов);
- openstackclient.yml (сценарий развертывания openstack)
*его мы намеренно выносим отдельно;
- deploy_host_incklude.yml (сценарий общего запуска всех сценариев);
- inventory.ini (общие параметры запуска Ansible);
- semaphore_install.yml (сценарий развертывания semaphore)
 *python3-module-psycopg2 добавить при установке данный пакет, чтобы добавлять юзеров и управлять СУБД из сценария;
```
