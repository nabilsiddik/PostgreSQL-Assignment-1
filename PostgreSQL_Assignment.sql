create table rangers (ranger_id SERIAL PRIMARY key, name varchar(50), region VARCHAR (50));


create table species (species_id SERIAL PRIMARY KEY, common_name VARCHAR (50), scientific_name VARCHAR (50), discovery_date DATE, conservation_status VARCHAR(50));



create table sightings (sighting_id SERIAL PRIMARY KEY, ranger_id INTEGER REFERENCES rangers(ranger_id), species_id INTEGER REFERENCES species(species_id), sighting_time TIMESTAMP, location VARCHAR (50), notes TEXT);



insert into rangers (name, region) values ('Alice Green', 'Northern Hills'), ('Bob White', 'River Delta'), ('Carol King', 'Mountain Range');

select * from rangers;

insert into species (common_name, scientific_name, discovery_date, conservation_status) values ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

select * from species;


insert into sightings (species_id, ranger_id, location, sighting_time, notes) values (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

select * from sightings;