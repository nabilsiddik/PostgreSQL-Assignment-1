-- Create rangers table
create table rangers (ranger_id SERIAL PRIMARY key, name varchar(50), region VARCHAR (50));


-- Ceate species table
create table species (species_id SERIAL PRIMARY KEY, common_name VARCHAR (50), scientific_name VARCHAR (50), discovery_date DATE, conservation_status VARCHAR(50));


-- Create sightings table
create table sightings (sighting_id SERIAL PRIMARY KEY, ranger_id INTEGER REFERENCES rangers(ranger_id), species_id INTEGER REFERENCES species(species_id), sighting_time TIMESTAMP, location VARCHAR (50), notes TEXT);


-- Insert data into rangers
insert into rangers (name, region) values ('Alice Green', 'Northern Hills'), ('Bob White', 'River Delta'), ('Carol King', 'Mountain Range');

select * from rangers;


-- Insert data into species
insert into species (common_name, scientific_name, discovery_date, conservation_status) values ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

select * from species;


-- Insert data into sightings
insert into sightings (species_id, ranger_id, location, sighting_time, notes) values (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

select * from sightings;



-- Problem 1
insert into rangers (name, region) values('Derek Fox', 'Coastal Plains');




-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;




-- Problem 3
select * from sightings WHERE location like '%Pass%';



-- Problem 4
select name, count(ranger_id) as total_sightings from rangers JOIN sightings USING(ranger_id) GROUP BY (ranger_id);


-- Problem 5
select common_name from species LEFT JOIN sightings USING(species_id) where sighting_id IS NULL;


-- Problem 6
select sp.common_name, si.sighting_time, ra.name from sightings si JOIN species sp on si.species_id = sp.species_id join rangers ra on si.ranger_id = ra.ranger_id order by (si.sighting_time) desc limit 2;



-- Problem 7
update species set conservation_status = 'Historic' where extract (year from discovery_date) < 1800;



-- Problem 8
SELECT sighting_id,
case
when EXTRACT(hour from sighting_time) < 12 then 'Morning'
when extract(hour from sighting_time) >= 12 and extract(hour from sighting_time) <= 17 then 'Afternoon'
else 'Evening'
end as time_of_day
from sightings;