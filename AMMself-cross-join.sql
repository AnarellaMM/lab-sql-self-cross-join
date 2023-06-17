use sakila; 

-- Get all pairs of actors that worked together.
select fa1.actor_id as actor1_id, a1.first_name as actor1_first_name, a1.last_name as actor1_last_name,
       fa2.actor_id as actor2_id, a2.first_name as actor2_first_name, a2.last_name as actor2_last_name
from film_actor fa1
join film_actor fa2 on fa1.film_id = fa2.film_id
join actor a1 on fa1.actor_id = a1.actor_id
join actor a2 on fa2.actor_id = a2.actor_id
where fa1.actor_id < fa2.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.
select c1.customer_id as customer1_id, c1.first_name as customer1_first_name, c1.last_name as customer1_last_name,
       c2.customer_id as customer2_id, c2.first_name as customer2_first_name, c2.last_name as customer2_last_name,
       r.rental_id, f.title, COUNT(*) as rental_count
from rental r
join customer c1
join customer c2
join film f
group by c1.customer_id, c2.customer_id, r.rental_id, f.title
having count(*) > 3;


-- Get all possible pairs of actors and films.

select a.actor_id, a.first_name, a.last_name, f.film_id, f.title
from actor a
cross join film f;