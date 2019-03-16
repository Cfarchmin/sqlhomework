#7a.

select film.title, language.name from film
join language on film.language_id = language.language_id
where language.name = 
	(select name from language 
    where language_id = 1)
and film.title like 'Q%' or title like 'K%';

#7b.
select film.title, actor.first_name, actor.last_name from film_actor
join film on film_actor.film_id = film.film_id
join actor on film_actor.actor_id = actor.actor_id
where film.title = 
	(select title from film 
    where title = 'Alone Trip');
    
#7c.
select customer.first_name, customer.last_name, customer.email, country.country from customer
left join address on customer.address_id = address.address_id
left join city on address.city_id = city.city_id
left join country on city.country_id = country.country_id
where country.country_id = 20;

#7d.
select film.title, category.name from film
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id
where category.name like '%family%';

#7e.
select film.title, film.film_id, count(rental.rental_id) as "Rental Frequency"  from film
join inventory on inventory.film_id = film.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by title
order by count(rental.rental_id) DESC;

#7f.
use sakila;
select store.store_id,sum(payment.amount) as "Revenue" from store
join staff on store.store_id = staff.store_id
join payment on staff.staff_id = payment.staff_id
group by store.store_id
order by sum(payment.amount) DESC;

#7g.
select store.store_id, city.city, country.country from store
join address on store.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id;

#7h.
select category.name, sum(payment.amount) as "Gross Revenue" from category
join film_category on film_category.category_id = category.category_id
join inventory on film_category.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
group by category.name
order by sum(payment.amount) desc limit 5;

#8a.
create view top_five_genres_by_revenue as
select category.name, sum(payment.amount) as "Gross Revenue" from category
join film_category on film_category.category_id = category.category_id
join inventory on film_category.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
group by category.name
order by sum(payment.amount) desc limit 5;

#8b.
select * from top_five_genres_by_revenue;

#8c.
drop view top_five_genres_by_revenue;

