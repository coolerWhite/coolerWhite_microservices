# coolerWhite_microservices
coolerWhite microservices repository
Сервисы mogodb raddis подняты локально в докер контейнере

docker-3
=================
скачана и распакован архив reddit-microservices. переименнован в src
добавлены 3 Dockerfile в "comment" "post-py" "ui"

Изменеия произведены из-за ошибок в первоначальном коде и не возможности установить applience

изменено
./comment/Dockerfile
FROM ruby:2.2 -> FROM ruby:2.5
./ui/Dockerfile
FROM ubuntu:16.04 -> FROM ubuntu:20.04

`RUN apt-get update \
 && apt-get install -y ruby-full ruby-dev build-essential \
 && gem install bundler --no-ri --no-rdoc`

`RUN apt update \
    && apt install -y ruby-full ruby-dev build-essential \
    && gem install bundler -v 1.17.2 \
    && gem install bundler -v 2.4`

# gitlab-ci-1
=================

 ## Terraform
 Запуск через terraform apply
  - main.tf : описана конфигурация сервера
  - outputs.tf :
  - variables.tf : вывод IP на косоль после исполнения
  - terraform.tfvars.example : подставить свои переменные
 ## Ansible
 Запуск через terraform apply
  - install.yml: описана конфигурация сервера
  - ansible.cfg : файл конфигурации Ansible
  - inventory.yml : сервер(а) где используем Ansible
  - requirements.txt : Ansible version
 ## Как запустить:
  - подставить в terraform.tfvars.example (удалить .example) свои значения
  - проверить через validate, что все написанно корректно
  - terraform apply : для запуска
  - ssh -i ~./ssh_key user_name@server_ip : для проверки работы сервера и ключа SSH
  - ansible-playbook install.yml -v : запуск playbook и отслеживание состояния
  - docker exec -it id_docker_container grep 'Password:' /etc/gitlab/initial_root_password : для получения password_root

=================
logging-1
====
export USER_NAME=coolerwhite
docker login

YC
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go install github.com/yandex-cloud/docker-machine-driver-yandex@latest
