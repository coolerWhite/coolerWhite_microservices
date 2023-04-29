# coolerWhite_microservices
coolerWhite microservices repository
Сервисы mogodb raddis подняты локально в докер контейнере

=================
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

RUN apt-get update \
 && apt-get install -y ruby-full ruby-dev build-essential \
 && gem install bundler --no-ri --no-rdoc

RUN apt update \
    && apt install -y ruby-full ruby-dev build-essential \
    && gem install bundler -v 1.17.2 \
    && gem install bundler -v 2.4
To install the missing version, run `gem install bundler:1.17.2
