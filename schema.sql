/* Database schema to keep the structure of entire database. */

CREATE TABLE Animals (
	id INT PRIMARY KEY NOT NULL,
	name TEXT,
	Date_of_birth DATE,
	escape_attempts INT,
	neutered BIT,
	weight_kg REAL
);