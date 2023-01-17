### Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY
<pre>

select
    ar.name "Artist Name",
    count(*) "Number of Songs"
from
    song s join album  al on s.album_id = al.id
    	   join artist ar on al.artist_id = ar.id
where ar.name like 'M%'
group by
    ar.name
order by
    count(*) desc
    
</pre>

### Execute other different SQL queries DDL, DML, DCL
<pre>
drop table artist_copy;
CREATE TABLE artist_copy AS SELECT * FROM artist;
select * from artist_copy;
delete ignore from artist_copy where name like 'M%';
ALTER TABLE artist_copy MODIFY COLUMN id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;
</pre>
