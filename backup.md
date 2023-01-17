<pre>
C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump.exe -u music -p  music > ~\music.sql
SET FOREIGN_KEY_CHECKS=0;
drop table artist;
C:\Program Files\MySQL\MySQL Server 8.0\bin> mysql  -u music -p  music  < ~\music.sql


</pre>
