select * from artist;
select * from canvas_size;
select * from image_link;
select * from museum;
select * from museum_hours;
select * from product_size;
select * from subject;
select * from work;

/* Question 1: Fetch all the paintings which are not displayed on any museums?*/
select work_id , name 
from work
where museum_id is null ;

/*Question 2 Are there museum without any paintings?*/
select m.*
from museum m
left join work w on m.museum_id = w.museum_id
where w.museum_id is null;

/* Question 3:  How many paintings have an asking price of more than their regular price? */
select * from product_size
where sale_price > regular_price;

/* Question 4: Identify the paintings whose asking price is less than 50% of its regular price */
select * , ceil((((sale_price - regular_price ) * -1 )::numeric / regular_price)*100) pct 
from product_size
where ceil((((sale_price - regular_price ) * -1 )::numeric / regular_price)*100)> 50;


/* Question 5: which canva size costs the most  */
SELECT label, v.work_id , v.sale_price  from canvas_size a
inner join product_size v
on CAST(a.size_id AS text) = v.size_id
group by v.size_id , label , v.work_id , v.sale_price
order by v.sale_price desc;

/*Question 6: Delete duplicate records from work, product_size, subject and image_link tables*/
delete from work 
where ctid not in (select min(ctid)
from work
group by work_id );

delete from product_size 
where ctid not in (select min(ctid)
from product_size
group by work_id, size_id );

delete from subject 
where ctid not in (select min(ctid)
from subject
group by work_id, subject );

delete from image_link 
where ctid not in (select min(ctid)
from image_link
group by work_id );

/*Question 7  Identify the museums with invalid city information in the given dataset*/
select city from museum_hours
where city ~ '[^a-zA-Z\s-]';

/* Question 8: Identify the museums which are open on both Sunday and Monday. */
select museum_id from museum_hours
where day like 'Sunday' and museum_id in (
select museum_id from museum_hours
where day like 'Monday');

/*Question 9) Identify the museums which are open on both Sunday and Monday.Display museum name, city. */
select m1.museum_id , m1.name , m1.city from museum m1 
inner join (
select museum_id from museum_hours
where day like 'Sunday' and museum_id in (
select museum_id from museum_hours
where day like 'Monday')) m2
on m1.museum_id = m2.museum_id;


select subject ,count(work_id)from subject
group by subject
order by count(work_id) desc
limit 10;

/* Question 10: ) How many museum are open every single day? */
select museum_id , count( DISTINCT day) from museum_hours
group by museum_id
having count(DISTINCT day) = 7;

/*Question 11: Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)*/
select m.museum_id,count(w.work_id) as no_of_paintings from museum m
inner join work w
on w.museum_id = m.museum_id
group by m.museum_id
order by count(w.work_id) desc
limit 5;

/* Question 12: Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist) */
select a.artist_id , a.full_name, count(w.work_id) from artist a
inner join work w
on a.artist_id = w.artist_id
group by a.artist_id , a.full_name
order by count(w.work_id) desc
limit 5;	

/* Question 13: Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?*/
select m2.museum_id , m2.name,
(to_timestamp(close , 'HH:MI PM') - to_timestamp(open , 'HH:MI AM')) as diff
from museum_hours m1
inner join museum m2
on m1.museum_id = m2.museum_id
order by (to_timestamp(close , 'HH:MI PM') - to_timestamp(open , 'HH:MI AM')) desc
limit 1;


/* Question 14: Which are the top 5 most popular styles? (Popularity is defined based on most no of style displayed in museum) */
select count(w.work_id) , w.style from work w
inner join museum m
on m.museum_id = w.museum_id
group by w.style
order by count(w.work_id) desc
limit 5;

/* Question 15: Identify the artists whose paintings are displayed in multiple countries*/
select count(work_id) ,country, w.artist_id from work w
inner join museum m
on w.museum_id = m.museum_id
group by w.artist_id , country


/*Question 16 : Which country has the 5th highest no of paintings?*/
with country_ranking as (
select m.country,count(*) as total_museum,
rank() over(order by count(*) desc) rnk
from museum m 
inner join work w on w.museum_id = m.museum_id
group by m.country)
select country
from country_ranking
where rnk = 5

/* Question 17 :Identify the artist and the museum where the most expensive and least expensive painting is placed. 
Display the artist name, sale_price, painting name, museum name, museum city*/

with RankedPaintings as(
select p.work_id , m.museum_id , m.name , m.city, a.artist_id  , a.full_name , sale_price , w.name ,
rank() over(order by sale_price desc) as most_expensive,
rank() over(order by sale_price) as least_expensive
from product_size p
inner join work w
on p.work_id = w.work_id
inner join museum m
on w.museum_id = m.museum_id
inner join artist a
on a.artist_id = w.artist_id
)
select 
*
from RankedPaintings
where most_expensive = 1 OR least_expensive = 1;








