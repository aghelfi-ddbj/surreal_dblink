# Surreal dblink
Test (public) dblink using SurrealDB


[Install SurrealDB](https://surrealdb.com/docs/start/installation)

[Run SurrealDB](https://surrealdb.com/docs/start): Persistent data
```
surreal start --log info --user root --pass root file://home/username/mytestdir/surrealdb
```
Upload table
```
surreal import --conn http://localhost:8000 --user root --pass root --ns test --db dblink mtb2surreal.sql
```
ns: namespace <br>
db: database name <br>
upload filename: mtb2surreal.sql <br>
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
// SELECT examples for Metabobank
SELECT id,status FROM mtb
SELECT id,bioproject_id FROM mtb
SELECT id,status FROM mtb WHERE status = "Public"

[
  {
    "result": [
      {
        "id": "mtb:MTBKS157",
        "status": "Public"
      },
      {
        "id": "mtb:MTBKS201",
        "status": "Public"
      },
      {
        "id": "mtb:MTBKS213",
        "status": "Public"
      },
      {
        "id": "mtb:MTBKS214",
        "status": "Public"
      }
    ],
    "status": "OK",
    "time": "2.763877ms"
  }
]

```
