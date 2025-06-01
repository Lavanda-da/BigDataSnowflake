CREATE TABLE IF NOT EXISTS types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS breeds (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS countries (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pets (
	id SERIAL PRIMARY KEY,
	type_id INT,
	name VARCHAR(100),
	breed_id INT,
	FOREIGN KEY (type_id) REFERENCES types(id),
    FOREIGN KEY (breed_id) REFERENCES breeds(id)
);

CREATE TABLE IF NOT EXISTS customers (
	id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    country_id INT,
    postal_code VARCHAR(100),
    pet_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (pet_id) REFERENCES pets(id)
);

CREATE TABLE IF NOT EXISTS sellers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    country_id INT,
    postal_code VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES countries(id)
);


CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL,
    quantity INT,
    pet_category VARCHAR(100),
    weight NUMERIC(10, 2),
    color VARCHAR(100),
    size VARCHAR(100),
    brand VARCHAR(100),
    material VARCHAR(100),
    description VARCHAR(1000),
    rating DECIMAL,
    reviews INT,
    release_date DATE,
    expire_date DATE
);

CREATE TABLE IF NOT EXISTS stores (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	location VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(100),
	country_id INT,
	phone VARCHAR(100),
	email VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES countries(id)
);


CREATE TABLE IF NOT EXISTS suppliers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	contact VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(100),
	address VARCHAR(100),
	city VARCHAR(100),
	country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    seller_id INT,
    product_id INT,
    store_id INT,
    supplier_id INT,
    date DATE,
    quantity INT,
    total_price DECIMAL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (seller_id) REFERENCES sellers(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (store_id) REFERENCES stores(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

