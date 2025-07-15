create table poowerbi (id int,department_name varchar(20),sales int);
select * from poowerbi;
insert into poowerbi values(1,"hr",3000),
(2,"hr",4000),
(3,"hr",5000),
(4,"fc",6000),
(4,"fc",7000);
insert into poowerbi values(5,"hr",4000);

select * ,rank() over(partition by department_name order by sales)
from poowerbi
order by sales;
