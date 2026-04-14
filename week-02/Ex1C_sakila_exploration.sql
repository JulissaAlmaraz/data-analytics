/*
a)In the actor table and Columns scheme I see information about an actor like their ID, first and last name
b)In film and Columns I see a lot of information about a film
c)A table that contains both actor_id and film_id is the table film_actor
d)When right-clicking on rental and selecting rows, it is pretty clear to read because the names are all straightforward and simple. 
It tells me information about a rental, who rented it and when, the unique identifier of the rental, inventory, customer, and the staff.
e)The inventory table is similar, however it only has inventory, film, and store id. As well as the last update.
f)We would need to use the tables film, inventory, and rental. Rental table has information about which item was rented and when. Inventory table connects each rental to a film with the inventory id. And film tables has titles of the films. They are related to each other in this way: rental connects to inventory, and inventory connects to film
*/

SELECT rental_date, inventory_id FROM rental;
SELECT inventory_id, film_id FROM inventory;
SELECT film_id, title FROM film;