CREATE TABLESPACE hgj96 LOCATION '/var/db/postgres1/hgj96';
CREATE DATABASE fakegraydisk with template=template0 TABLESPACE=hgj96;


UPDATE pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;

CREATE DATABASE template1 with TABLESPACE = hgj96;
UPDATE pg_database SET datistemplate = true WHERE datname = 'template1';

create role sterus with login password '1234';
alter role sterus createdb;
grant connect on database postgres to sterus;
grant connect on database fakegraydisk to sterus;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO sterus;
ALTER USER myuser SET default_tablespace TO mytablespace;
GRANT USAGE ON SCHEMA public TO sterus;
GRANT CREATE ON SCHEMA public TO sterus;

BEGIN;
SET default_tablespace = hgj96;

create table airlines(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    founded_year INT
) tablespace hgj96;
CREATE TABLE airline_employees (
    id SERIAL PRIMARY KEY,
    airline_id INT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    hire_date DATE,
    FOREIGN KEY (airline_id) REFERENCES airlines(id) ON DELETE CASCADE
) tablespace hgj96;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) tablespace hgj96;

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    airline_id INT NOT NULL,
    flight_number VARCHAR(50) NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (airline_id) REFERENCES airlines(id) ON DELETE CASCADE
) tablespace hgj96;

INSERT INTO airlines (name, country, founded_year) VALUES ('AirTest', 'USA', 1995);
INSERT INTO airline_employees (airline_id, first_name, last_name, position, hire_date) VALUES (1, 'John', 'Doe', 'Pilot', '2010-06-15');
INSERT INTO users (username, email, full_name) VALUES ('jane_doe', 'jane.doe@example.com', 'Jane Doe');
INSERT INTO tickets (user_id, airline_id, flight_number, departure_time, arrival_time, price) VALUES (1, 1, 'AT123', '2025-06-01 10:00:00', '2025-06-01 14:00:00', 299.99);
COMMIT;