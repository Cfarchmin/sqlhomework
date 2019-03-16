describe staff;
describe address;
describe payment;
#6a
select staff.first_name, staff.last_name, address.address
from staff
join address on staff.address_id = address.address_id;

#6b.
use sakila;
select staff.staff_id, staff.first_name, staff.last_name, sum(payment.amount) as "Total Amount"
from staff
join payment on staff.staff_id = payment.staff_id
where payment.payment_date > 8/1/2005 and payment.payment_date<9/1/2005
group by staff.first_name;

#6c.
select count(film_actor.actor_id) as "actors", film_actor.film_id, film.title
from film_actor
join film on film_actor.film_id = film.film_id
group by film.film_id;

#6d.
select count(inventory.inventory_id), inventory.film_id, film.title
from inventory
join film on inventory.film_id = film.film_id
group by film.title
having title = "Hunchback Impossible";

#6e.
select customer.first_name, customer.last_name, sum(payment.amount) as "Total Paid"
from customer
join payment on customer.customer_id = payment.customer_id
group by customer.last_name
order by customer.last_name ASC;
