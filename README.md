# База данных для Музыкального магазина

### Добавление миграций:

- Создать в директории `./database/scripts/migrations` новый файл с именем вида `Vxxxx__[short name].sql`
- Пример:
```bash
cd ./database/scripts/migrations && touch V0001__create_tables.sql
```
- __Примечание__: старые файлы миграций менять/переименовывать нельзя, т.к. это поломает checksum.
- __Примечание__: Номера версий должны монотонно увеличиваться на 1.

### Запуск миграций:

- Для запуска миграций выполнить команду:
```bash
./gradlew flywayMigrate
```
- __Примечание__: БД должна быть запущена.

### Запуск БД через docker-compose.yml

- Пример запуска контейнера (проверял на Windows):
```bash
docker-compose -f ./database/docker/postgresql.yml -p docker restart postgres
```

Docker (linux):

- Install docker:
```bash
sudo apt-get purge docker-ce docker-ce-cli containerd.io && sudo apt-get install docker-ce docker-ce-cli containerd.io
```

- Start docker (optional)
```bash
systemctl start docker
```

- Show all containers
```bash
docker ps -a
```
