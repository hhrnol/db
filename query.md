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
