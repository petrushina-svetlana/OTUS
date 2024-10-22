## Домашнее задание к занятию "7.DDL: создание, изменение и удаление объектов в PostgreSQL"

Используя операторы DDL создайте

Создаю на примере собственной БД Частное швейное производство (sewing_prod).

1.  Табличные пространства и роли.

Создаю пользователя-владельца БД:

```
CREATE ROLE sewing_admin WITH 
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	LOGIN
	REPLICATION
	BYPASSRLS
	CONNECTION LIMIT -1;
```

Создаю обычного пользователя:

```
CREATE ROLE sewing_user WITH 
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	NOINHERIT
	LOGIN
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1;
```

Создаю табличное пространство для файлов БД:

```
create tablespace sewing location '/mnt/ssd_1';
```

И назначаю это табличное пространство по-умолчанию для нашей БД:

```
SET default_tablespace = sewing;
```

2. Базу данных.

```
CREATE DATABASE sewing_prod 
WITH OWNER = sewing_admin
ENCODING = 'UTF8'
TEMPLATE = template0;
```
Выдаю права для пользователя sewing_admin:

```
GRANT CREATE ON SCHEMA public TO sewing_admin;
GRANT USAGE ON SCHEMA public TO sewing_admin;
GRANT CONNECT ON DATABASE sewing_prod TO sewing_admin;
GRANT CREATE ON DATABASE sewing_prod TO sewing_admin;
GRANT TEMP ON DATABASE sewing_prod TO sewing_admin;
```

3. Схемы данных.

```
CREATE SCHEMA main AUTHORIZATION sewing_admin;
CREATE SCHEMA prod_warehouse AUTHORIZATION sewing_admin;
CREATE SCHEMA selling AUTHORIZATION sewing_admin;
CREATE SCHEMA warehouse AUTHORIZATION sewing_admin;
```

4. Таблицы своего проекта, распределив их по схемам и табличным пространствам.

Ссылка на каталог с запросами на создание таблиц БД:
[queries](queries)
