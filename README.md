# batala_microservices
batala microservices repository
# Docker-2
Добавил Dockerfile
Чтобы собрать свой образ необходимо:
1. Перейти в директорию docker-monolith
2. Выполнить комманду
```shell
docker build -t reddit:local-test .
```
3. Для запуска приложения выполнить команду:
```shell
docker run -d -p 9292:9292 --name reddit reddit:local-test
```
4. Для проверки работы приложения в адресной строке браузера ввести
http://127.0.0.1:9292

# Docker-3
Разбил монолит на микросерсвисы.
Сделал  базовые образов на alpine
Для запуска приложения выполнить команды:
```shell
docker network create reddit
docker run -d --network reddit --network-alias mongodb --name mongodb -v reddit_db:/data/db mongo:latest
docker run -d --network reddit --network-alias app_post --name app_post --env POST_DATABASE_HOST=mongodb rshalgochev/post:1.0
docker run -d --network reddit --network-alias app_comment --name app_comment --env COMMENT_DATABASE_HOST=mongodb rshalgochev/comment:2.0
docker run -d --network reddit --name app_ui -p 9292:9292 --env POST_SERVICE_HOST=app_post --env COMMENT_SERVICE_HOST=app_comment rshalgochev/ui:2.0
```
Проверить рабоу прилодения можно перейдя в браузере по адресу http://127.0.0.1:9292

Чтобы остановить запущенное прилоджение выоплнить команду:
```shell
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
```
# Docker-4
Написал docker-compose.yml
Чтобы чтобы развернуть прилоение выполнить команду
```shell
docker-compose up -d
```