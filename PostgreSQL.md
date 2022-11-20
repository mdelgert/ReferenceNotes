https://github.com/morenoh149/postgresDBSamples

https://hub.docker.com/_/postgres

```console
docker run --name dev-postgres -e POSTGRES_PASSWORD=Password2022 -p 5432:5432 -d postgres
```

```console
docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```

https://www.timescale.com/blog/how-to-install-psql-on-mac-ubuntu-debian-windows/

```console
sudo apt-get install postgresql-client
```

https://www.ionos.com/digitalguide/server/configuration/solve-the-postgresql-error-psql-fatal-database-root-does-not-exist/

su - postgres

psql

https://dba.stackexchange.com/questions/1285/how-do-i-list-all-databases-and-tables-using-psql
https://chartio.com/resources/tutorials/how-to-list-databases-and-tables-in-postgresql-using-psql/

# List database
\l

# Change database
\c database

# List tables
\dt

https://www.postgresql.org/docs/current/sql-createdatabase.html
CREATE DATABASE test;

https://www.ntchosting.com/encyclopedia/databases/postgresql/

CREATE TABLE phonebook(phone VARCHAR(32), firstname VARCHAR(32), lastname VARCHAR(32), address VARCHAR(64));

INSERT INTO phonebook(phone, firstname, lastname, address) VALUES('+1 123 456 7890', 'John', 'Doe', 'North America');

SELECT * FROM phonebook;