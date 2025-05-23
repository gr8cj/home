use dummy;
select count(*),country from customers group by country;
select * from products; 
select distinct country from customers ;
select country from customers group by country;

select * from customers;
select * from orders;

select customername ,count(ordernumber)  as ordercount from customers inner join orders using (customernumber) group by customername having ordercount >3 order by ordercount desc;


