/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE Animals (
	id INT PRIMARY KEY NOT NULL,
	name TEXT,
	Date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg REAL
);

ALTER TABLE animals ADD species TEXT;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INT 
)

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name TEXT
)
