---Question 1---- (List of staff members with first name, last name, email and store ID)

select * from public.staff

select first_name, last_name, email, staff_id from public.staff

---Question 2---- (Separate count of inventory items at each store)

select * from public.inventory

select count(inventory_id) from public.inventory
group by store_id

---Question 3---- (Count of active customers at each store)

select * from public.customer

select count(customer_id) from public.customer
where active = 1
group by store_id

---Question 4--- (Count of email addresses)

select * from public.customer

select count(email) from public.customer

---Question 5--- (Count of films and categories)

select * from public.film_category

select count(film_id) as count_of_unique_tittles, count(category_id) as category_count 
from public.film_category


select * from public.customer

---Question 6---(Replacement cost of films)
select * from public.film

select
min(replacement_cost) as least_expensive_to_replace,
max(replacement_cost) as most_expensive_to_replace,
avg(replacement_cost) as average_of_all_films
from public.film

---Question 7--- (payment process)
select * from public.payment

select 
avg(amount) as average_payment_processed,
max(amount) as maximum_payment_processed
from public.payment

--Question 8--- (customer per rental)
select * from public.rental

select customer_id,
count(rental_id) as number_of_rentals
from public.rental
group by customer_id 
order by count(rental_id) desc


---Question 9---(Manger's information)
select * from public.staff
select * from public.country
select * from public.city

select staff.store_id,
staff.first_name as "Manager first name",
staff.last_name as "Manager last name",
address.address, address.district, city.city,
country.country
from public.staff
inner join address
on staff.store_id = address.address_id
inner join city on staff.store_id = city.city_id
inner join country
on staff.store_id = country.country_id

---Question 10---
select * from public.inventory
select * from public.film

select 
inventory.store_id, inventory.inventory_id,
film.title, film.rating, film.rental_rate,
film.replacement_cost
from public.inventory
left join film
on inventory.inventory_id = film.film_id

---Question 11----
select 
inventory.store_id,
film.rating,
count(inventory.inventory_id) as count_of_inventory_item
from public.inventory
left join film
on inventory.film_id = film.film_id
group by inventory.store_id, film.rating

---Question 12---
select * from public.film_category
select * from public.store

select 
store_id,
category.name as category,
count(inventory.inventory_id) as number_of_films,
avg(film.replacement_cost) as "average replacement cost",
sum(film.replacement_cost) as "total replacement cost"
from public.inventory
left join public.film
on inventory.film_id = film.film_id
left join film_category
on film.film_id = film_category.film_id
left join category
on category.category_id = film_category.category_id
group by store_id, category.name
order by number_of_films desc

---Question 13---(Customers list)
select * from public.customer
select * from public.address
select * from public.city
select * from public.country
select * from public.store

select customer.store_id,
customer.first_name as "customer first name",
customer.last_name as "customer last name",
customer.active, 
address.address as street_address,
city.city,
country.country
from public.customer
left join address
on customer.address_id = address.address_id
left join city
on address.city_id = city.city_id
left join country
on city.country_id = country.country_id


---Question 14---
select * from public.payment
select * from public.customer

select 
customer.first_name as customer_first_name, 
customer.last_name as customer_last_name,
count(rental.rental_id) as "total lifetime rentals",
sum(payment.amount) as total_lifetime_value
from public.customer
left join rental
on customer.customer_id = rental.customer_id
left join payment
on rental.rental_id = payment.rental_id
group by customer.first_name, customer.last_name
order by sum(payment.amount) desc

---Question 15---
select * from public.language











select * from public.customer
inner join film
on customer.customer_id = film.film_id

select customer.first_name, customer.last_name, customer.address_id, film.title,
film.description
from public.customer
inner join film
on customer.customer_id = film.film_id
order by first_name, last_name desc
limit 5

select * from public.inventory
union
select * from public.store







