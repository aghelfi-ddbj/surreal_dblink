# Surreal dblink
Test (public) dblink using SurrealDB


[Install SurrealDB](https://surrealdb.com/docs/start/installation)

[Run SurrealDB](https://surrealdb.com/docs/start): Persistent data
```
surreal start --log info --user root --pass root file://home/username/mytestdir/surrealdb
```
Upload table
```
surreal import --conn http://localhost:8000 --user root --pass root --ns test --db bioproject table_1.sql
```
ns: namespace <br>
db: database name <br>
upload filename: table_1.sql <br>
<br>
Connect database using CLI
```
surreal sql --conn http://localhost:8000 --user root --pass root --ns test --db bioproject --pretty
```
exit: CTRL+c

Commands:<br>
```
// Information for DB
INFO FOR DB; 
// Information for Namespace
INFO FOR KV; 
```
