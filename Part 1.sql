# 1a. display first and last name
use sakila;
describe actor;
select first_name, last_name from actor;

# 1b. concatenate first_name and last_name into one column "Actor Name"
select upper(concat(first_name, ' ',last_name)) as 'Actor Name' from actor;

# 2a. find Joe
select actor_id, first_name, last_name from actor
where first_name = "Joe";

#2b. 
select first_name, last_name from actor
where last_name like '%Gen%';

#2c. 
ALTER TABLE `sakila`.`actor` 
CHANGE COLUMN `last_name` `last_name` VARCHAR(45) NOT NULL AFTER `actor_id`;
select last_name, first_name from actor
where last_name like '%LI%';

#2d.
select * from country
where country in
(
	select country from country 
    where country = 'Afghanistan' or  country = 'China' or  country = 'Bangladesh'
    );
    
#3a.
ALTER TABLE `sakila`.`actor` 
ADD COLUMN `decription` BLOB NULL AFTER `last_update`;
select * from actor;

#3b.
ALTER TABLE `sakila`.`actor` 
DROP COLUMN `decription`;

#4a. 
select last_name, count(last_name) as "Number of Actors" from actor
group by last_name;

#4b.
select last_name, count(last_name) from actor
group by last_name
having count(last_name)>1;

#4c. 
select * from actor
where first_name = 'GROUCHO';
UPDATE actor
set first_name = 'HARPO'
where actor_id = 172;
select * from actor
where first_name = 'HARPO';

#4d.
UPDATE actor
set first_name = 'GROUCHO'
where actor_id = 172;

select * from actor
where first_name = 'GROUCHO';

#5a.
select * from address;
show create table address;