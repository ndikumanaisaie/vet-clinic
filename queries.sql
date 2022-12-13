/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM Animals WHERE name LIKE '%mon';
SELECT name FROM Animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT name FROM Animals WHERE neutered IS TRUE AND escape_attempts<3;
SELECT Date_of_birth FROM Animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM Animals WHERE weight_kg>10.5;
SELECT name FROM Animals WHERE neutered IS TRUE;
SELECT name FROM Animals WHERE name NOT IN ('Gabumon');
SELECT name FROM Animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT birth;
UPDATE animals SET weight_kg=-1*weight_kg;
ROLLBACK TO birth;
UPDATE animals SET weight_kg=-1*weight_kg WHERE weight_kg<0;
SELECT * FROM animals;
COMMIT; 

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, count(neutered) as result FROM animals GROUP BY neutered ORDER BY result DESC LIMIT 1;
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE full_name='Melody Pond';
SELECT animals.name AS animal_name, species.name AS species_type FROM animals JOIN species ON animals.species_id=species.id WHERE species.name='Pokemon';
SELECT full_name, animals.name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;
SELECT count(animals) FROM animals JOIN species ON animals.species_id=species.id;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Jennifer Orwell';
SELECT animals.name, animals.escape_attempts FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name , COUNT(animals.name) AS total_animals FROM owners JOIN animals ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1;

SELECT v.date as visit_date, a.name, vt.name from visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt 
ON v.vets_id=vt.id 
WHERE vt.name='William Tatcher' 
ORDER BY visit_date 
DESC LIMIT 1;

SELECT COUNT(a.name) from visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt 
ON v.vets_id=vt.id 
WHERE vt.name='Stephanie Mendez';

SELECT species.name 
AS species_type, vt.name 
AS vet_name from specializations s 
JOIN species 
ON s.species_id=species.id FULL 
JOIN vets vt 
ON s.vets_id=vt.id;

SELECT v.date as visit_date, a.name 
AS animal_name, vt.name as vet_name from visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt
ON v.vets_id=vt.id 
WHERE vt.name='Stephanie Mendez' 
AND v.date 
BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(a.name) 
AS count_visits FROM visits v 
JOIN animals a ON v.animals_id=a.id 
JOIN vets vt ON v.vets_id=vt.id 
GROUP BY a.name 
HAVING COUNT(a.name) = (
    SELECT MAX(myf.count_visits) 
    FROM ( select a.name, COUNT(a.name) 
    AS count_visits from visits v 
    JOIN animals a ON v.animals_id=a.id 
    JOIN vets vt ON v.vets_id=vt.id 
    GROUP BY a.name) 
    AS myf
);

SELECT v.date as visit_day, a.name 
AS animal_name, vt.name AS vet_name 
FROM visits v JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt 
ON v.vets_id=vt.id 
WHERE vt.name='Maisy Smith' 
ORDER BY v.date 
LIMIT 1;

SELECT animals.name AS animal_name,
animals.date_of_birth, animals.escape_attempts, 
animals.neutered, animals.weight_kg, vets.name AS vet_name, 
vets.age, vets.date_of_graduation, 
visits.date FROM animals JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits 
JOIN vets ON vets.id = visits.vets_id JOIN animals
ON animals.id = visits.animals_id JOIN specializations
ON specializations.vets_id = vets.id
WHERE specializations.species_id <> animals.species_id;

SELECT species.name, COUNT(visits.animals_id) 
as count FROM animals JOIN visits 
ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id 
JOIN species ON species.id = animals.species_id 
WHERE vets.name = 'Maisy Smith' 
GROUP BY species.name ORDER BY count DESC LIMIT 1; 

SELECT COUNT(*) 
FROM visits where animals_id = 4;

SELECT * FROM visits 
WHERE vets_id = 2;

SELECT * FROM owners 
WHERE email = 'owner_18327@mail.com';
