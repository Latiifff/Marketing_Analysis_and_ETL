with cs_demographics as(
select age, gender, country, city, platform
from cs_profile cpr
inner join cs_address cad
on cpr.username = cad.username    
group by 1, 2, 3, 4, 5
order by 1, 3, 4, 5
)
, user_counts as (
select age, count(age) as user_count_by_age
from cs_demographics
group by age
order by age
)
, segmented_age as(
select age, case
	when age between 9 and 24 THEN 'Gen Z'
	when age between 25 and 40 THEN 'Millenial'
	when age between 41 and 46 THEN 'Gen X'
    else 'Baby Boomer'
    end as generation
from cs_demographics
)
, gender_counts as(
select gender, count (gender) as user_count_by_gender
from cs_demographics
group by gender
)
, country_counts as(
select country, count (country) as user_count_by_country
from cs_demographics
group by country
order by country
)
, city_counts as(
select country, city, count (city) as user_count_by_city
from cs_demographics
group by country, city
order by 1
)
select generation, 
    count(age) as count
from segmented_age
group by generation;

select * from cs_demographics
select * from user_counts
select * from gender_counts
select * from country_counts
select * from city_counts

