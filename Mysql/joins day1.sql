use dummy;
select * from customers;

select * from orders;

select o.* from customers c inner join orders o 
on c.customernumber=o.customernumber;

select c.customernumber,c.city,c.customername,o.status from customers c inner join orders o
on c.customernumber=o.customernumber;

select customernumber ,city,customername,status from customers inner join orders using(customernumber); -- give no ambigious error

-- place no  order 
select distinct customernumber from customers left join orders  o using(customernumber)
where o.customernumber is null;
-- place atleast 1 order

select distinct customernumber from customers right join orders  o using(customernumber);



select * from orders;
select distinct customernumber from customers c right join orders  o using(customernumber)
where c.customernumber is null;
select * from orders;

select count(*)  from orders;
-- country must be usa

select distinct customernumber from customers inner join orders using (customernumber) where country ="usa";
select count(*) from customers inner join orders using(customernumber);


-- alteas 1 order order date 2003-01-01 and in 2003-05-01

select  customernumber from customers inner join orders using(customernumber) where
orderdate between "2003-01-01" and "2003-05-01";