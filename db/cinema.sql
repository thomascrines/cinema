DROP TABLE Tickets;
DROP TABLE Films;
DROP TABLE Customers;

CREATE TABLE Films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price REAL
  );

CREATE TABLE Customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds REAL
  );

CREATE TABLE Tickets (
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE
  );