### mysqldump
<pre>
mysqldump --databases music --master-data=2 --single-transaction --order-by-primary -r ~\music.sql -u root -p 
</pre>
### aws restore
<pre>
aws s3  cp  s3://hhrnol/music.sql - | mysql -h hhnrol.c1cjbzdcmaxj.eu-central-1.rds.amazonaws.com -u admin -p music

mysql -h hhnrol.c1cjbzdcmaxj.eu-central-1.rds.amazonaws.com -u admin -p
Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 404
Server version: 8.0.28 Source distribution

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| music              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.03 sec)
Database changed
</pre>
### Query 
<pre>
mysql> select
    ->     ar.name "Artist Name",
    ->     count(*) "Number of Songs"
    -> from
    ->     song s join album  al on s.album_id = al.id
    ->        join artist ar on al.artist_id = ar.id
    -> where ar.name like 'M%'
    -> group by
    ->     ar.name
    -> order by
    ->     count(*) desc;
+-------------+-----------------+
| Artist Name | Number of Songs |
+-------------+-----------------+
| Metallica   |               6 |
| Megadeth    |               4 |
+-------------+-----------------+
2 rows in set (0.41 sec)
</pre>
