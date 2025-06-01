INSERT INTO breeds (name)
SELECT DISTINCT customer_pet_breed
FROM mock_data
WHERE customer_pet_breed IS NOT NULL;

INSERT INTO types (name)
SELECT DISTINCT customer_pet_type
FROM mock_data
WHERE customer_pet_type IS NOT NULL;

with cntr as (
	select customer_country as country
	from mock_data
	union
	select seller_country as country
	from mock_data
	union
	select store_country as country
	from mock_data
	union
	select supplier_country as country
	from mock_data
)

insert into countries (name)
select distinct country
from cntr
where country is not null;

insert into pets (name, type_id, breed_id)
select
	customer_pet_name,
	(select id from types where name = customer_pet_type),
	(select id from breeds where name = customer_pet_breed)
from mock_data
where customer_pet_name is not null;

insert into customers (first_name, last_name, age, email, country_id, postal_code, pet_id)
select
	customer_first_name, customer_last_name, customer_age, customer_email,
	(select id from countries where name = customer_country),
	customer_postal_code,
	(select id from pets where name = customer_pet_name)
from mock_data;


insert into sellers (first_name, last_name, email, country_id, postal_code)
select
	seller_first_name, seller_last_name, seller_email,
	(select id from countries where name = customer_country),
	seller_postal_code
from mock_data;

insert into products (name, category, price, quantity, pet_category, weight, color, size, brand, material, description, rating, reviews, release_date, expire_date)
select
	product_name,
	product_category,
	product_price,
	product_quantity,
	product_pet_category,
	product_weight,
	product_color,
	product_size,
	product_brand,
	product_material,
	product_description,
	product_rating,
	product_reviews,
	product_release_date,
	product_expire_date
from mock_data;

insert into stores (name, location, city, state, country_id, phone, email)
select
	store_name, store_location, store_city, store_state,
	(select id from countries where name = store_country),
	store_phone, store_email
from mock_data

insert into suppliers (name, contact, email, phone, address, city, country_id)
select
	supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city,
	(select id from countries where name = supplier_country)
from mock_data;

insert into sales (customer_id, seller_id, product_id, store_id, supplier_id, date, quantity, total_price)
select
	(select id from customers where first_name = customer_first_name and last_name = customer_last_name),
	(select id from sellers where first_name = seller_first_name and last_name = seller_last_name),
	(select id from products where name = product_name),
    (select id from stores where name = store_name),
    (select id from suppliers where name = supplier_name),
    sale_date,
    sale_quantity,
    sale_total_price
from mock_data;
