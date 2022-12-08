/* Populate database with sample data. */

INSERT INTO Animals(id, name, Date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES
(1, 'Agumon', '2020-2-3', 0, true, 10.23),
(2, 'Gabumon', '2018-11-5', 2, true, 8),
(3, 'Pikachu', '2021-1-7', 1, false, 15.4),
(4, 'Devimon', '2017-5-12', 5, true, 11),
(5, 'Charmander', '2020-02-08', 0, false, -11),
(6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7),
(7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13),
(8, 'Angemon', '2005-06-12', 1, TRUE, -45),
(9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4),
(10, 'Blossom', '1998-10-13', 3, TRUE, 17),
(11, 'Ditto', '2022-5-14', 4, TRUE, 22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id=1;
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';

UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name  IN ('Pikachu','Gabumon');
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');

INSERT INTO vets (id, name, age,date_of_graduation) VALUES (1, 'William Tatcher', 45, '2000-04-23');
INSERT INTO vets (id, name, age,date_of_graduation) VALUES (2, 'Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (id, name, age,date_of_graduation) VALUES (3, 'Stephanie Mendez', 64, '1981-06-08');
INSERT INTO vets (id, name, age,date_of_graduation) VALUES (4, 'Jack Harkness', 38, '2008-06-08');