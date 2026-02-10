# FastAPI Infrastructure with Load Balancing

Развертывание масштабируемого веб-приложения FastAPI с балансировкой нагрузки через Nginx.

## Архитектура

Инфраструктура состоит из 4 узлов:
- **control** (192.168.56.2) - Ansible host для автоматизации
- **postgres** (192.168.56.12) - База данных PostgreSQL
- **nginx** (192.168.56.10) - Load balancer
- **backend** (192.168.56.11) - Docker контейнеры с приложением


### Предварительные требования
- Vagrant 2.3+
- VirtualBox 7.0+

## Развертывание

### 1. Создать виртуальные машины
```bash
vagrant up
```
### 2. Запустить деплой инфраструктуры через control узел с Ansible
```bash
vagrant ssh control
cd /vagrant/ansible
./ssh-setup.sh # подготовка ssh-ключей для взаимодействия Ansible с другой инфраструктурой
ansible-playbook -i inventory.ini site.yml
```
После установки плейбука веб-интерфейс FastAPI доступен :
http://192.168.56.10/docs


## Масштабирование

При увеличении нагрузки можно увеличить количество реплик бэкенда:
### 1. Увеличить количество контейнеров
```bash
vagrant ssh backend
cd /opt/backend
docker-compose up -d --scale backend=5
```
### 2. Обновить конфигурацию nginx
```
# Добавить новые порты в upstream секцию /etc/nginx/sites-available/default:
# server 192.168.56.11:8003;
# server 192.168.56.11:8004;
```
### 3. Перезапустить nginx
```
sudo systemctl restart nginx
```
