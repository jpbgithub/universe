CREATE DATABASE universe;

CREATE TYPE shape AS ENUM ('round','spiral','elliptical','irregular','quasar','barred spiral');

CREATE TABLE galaxy(galaxy_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50) UNIQUE NOT NULL,
galaxy_shape shape,
description TEXT,
age_in_millions_of_years INT NOT NULL,
distance_from_earth NUMERIC(10,3)
);

CREATE TABLE star(star_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50) UNIQUE NOT NULL,
description TEXT,
age_in_millions_of_years INT NOT NULL,
is_spherical BOOLEAN,
galaxy_id INT,
CONSTRAINT fk_galaxy_id
    FOREIGN KEY(galaxy_id)
        REFERENCES galaxy(galaxy_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

);


CREATE TABLE planet(planet_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50) UNIQUE NOT NULL,
description TEXT,
age_in_millions_of_years INT NOT NULL,
has_life BOOLEAN,
star_id INT,
CONSTRAINT fk_star_id
    FOREIGN KEY(star_id)
        REFERENCES star(star_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE moon(moon_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50) UNIQUE NOT NULL,
description TEXT,
age_in_millions_of_years INT NOT NULL,
has_life BOOLEAN,
planet_id INT,
CONSTRAINT fk_planet_id
    FOREIGN KEY(planet_id)
        REFERENCES planet(planet_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE galaxy_stars(galaxy_stars_id INT UNIQUE NOT NULL PRIMARY KEY, star_id INT NOT NULL, name VARCHAR(50) );

-- add data
-- add galaxy, star, planet, moon
INSERT INTO galaxy (name, galaxy_shape,description,age_in_millions_of_years,distance_from_earth) VALUES
    ('Milky Way','spiral','Earth''s Galaxy',300,3000.000),
    ('Almond Joy','spiral','Almond Joy Glaxy',500,5000.000),
    ('Snickers','spiral','Snicker''s Galaxy',600,4000.000),
    ('Cosmos','spiral','Cosmos Galaxy',700,7000.000),
    ('Grungy','spiral','Grungy Galaxy',300,3000.000),
    ('404','spiral','Not Found Galaxy',300,3500.000);
    
INSERT INTO star (name, description, age_in_millions_of_years, is_spherical, galaxy_id) VALUES 
('The Sun', 'The Earths Sun', 1340, TRUE, 1),
('Alken Star', 'Segue 1 Sun', 1250, TRUE, 2),
('Coma Sun', 'Coma Berenices Dwarf Sun', 1270, TRUE, 3),
('Balken Brightview', 'Pisces Overdensity', 1290, TRUE, 4),
('Andromeda Overdrive','Andromeda Galaxy (M31) Sun', 1490, TRUE, 4),
('Fisherman Sun','Perseus I (Andromeda XXXIII)',1250, TRUE, 5);


INSERT INTO planet (name, description, age_in_millions_of_years, has_life, star_id) VALUES
('Mercury','The smallest planet in our solar system and nearest to the Sun, Mercury is only slightly larger than Earth''s Moon.',1340,FALSE,1),
('Earth','Planet Earth',1340,TRUE,1),
('Mars','Mars the red planet',1340,TRUE,1),
('Jupiter','The biggest planet in the Milky Way. Juno Orbiter is exlporing.',1340,FALSE,1),
('Saturn','Second largest planet made mostly of hydrogen and helium.',1340,FALSE,1),
('Uranus','Third larges and seventh from the sun.',1340,FALSE,1),
('Neptune','An ice giant and the most distant planet',134,FALSE,1),
('Pluto','This fascinating world has blue skies, spinning moons, mountains as high as the Rockies, and it snows – but the snow is red.',1340,FALSE,1),
('Ceres','Ceres is named for the Roman goddess of corn and harvests. The word cereal comes from the same name.',1340,FALSE,1),
('Andares','The Andararean homeworld in the Andromeda Galaxy.',1510,TRUE,2),
('Andares 2','The Andararean settlment in the Andromeda Galaxy.',1810,TRUE,2),
('HookandLine','Perseus I settlement world.',1270,FALSE,3);


INSERT INTO moon (name, description, age_in_millions_of_years,has_life, planet_id) VALUES 
('Earth Moon','Earths Moon',1340, TRUE,26),
('Phobe','Mars first moon',1340, FALSE,27),
('Io','Jupiters volcanically active moon with lava erupting kilomters high.',1340, FALSE,28),
('Europa','Jupiters iron core moon with an ocean of salty water.',1340, TRUE,28),
('Ganymede','Jupiters largest moon',1340, TRUE,28),
('Callisto','Jupiters most cratered moon.',1340, FALSE,28),
('Titan','Saturns largest moon. Has water.',1340, FALSE,29),
('Mimas','Saturns Deathstar like moon. May have water.',1340, FALSE,29),
('Tethys','Saturns moon with red mountains',1340, FALSE,29),
('Ariel','Uranus first moon',1340, TRUE,30),
('Belinda','Uranus second moon',1340, TRUE,30),
('Bianca','Uranus third moon',1340, TRUE,30),
('Caliban','Uranus fourth moon',1340, TRUE,30),
('Despina','Neptunes first moon',1340, TRUE,31),
('Galatea','Neptunes second moon',1340, TRUE,31),
('Hallimede','Neptunes third moon',1340, TRUE,31),
('Hippocamp','Neptunes fourth moon',1340, TRUE,31),
('Laomedeia','Neptunes fifth moon',1340, TRUE,31),
('Larissa','Neptunes sixth moon',1340, TRUE,31),
('Naiad','Neptunes seventh moon',1340, TRUE,31),
('Nereid','Neptunes eighth moon',1340, TRUE,31);


INSERT INTO galaxy_stars(galaxy_stars_id, star_id) VALUES 
(1,7),
(2,8),
(3,9),
(4,10),
(5,11),
(6,12);







