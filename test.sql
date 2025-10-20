CREATE TABLE peliculas(
id SERIAL PRIMARY KEY,
titulo VARCHAR(200),
isbn VARCHAR(20) UNIQUE,
precio DECIMAL(10,2),
temas TEXT[],
info_adicional JSONB
);





CREATE TABLE Alquileres (
id SERIAL PRIMARY KEY,
pelicula_id INT REFERENCES pelis(id),
usuario VARCHAR(100),
fecha_prestamo DATE,
fecha_devolucion DATE
);
INSERT INTO Alquileres (pelicula_id, usuario, fecha_prestamo,
fecha_devolucion) VALUES
(1, 'Juan Pérez', '2025-10-21', '2025-11-24'),
(2, 'María López', '2025-10-11', '2025-11-01'),
(3, 'Marío Garza', '2025-10-13', '2025-11-06'),
(4, 'Alejandro Garcia', '2025-10-15', '2025-11-15'),
(5, 'Kira Nicolaiva', '2025-10-18', '2025-11-10'),
(6, 'Franco Escamilla', '2025-10-19', '2025-11-25'),
(7, 'Camilo Ramirez', '2025-10-20', '2025-11-22'),
(8, 'Lorenzo Martinez', '2025-10-21', '2025-11-21'),
(9, 'Juan Cubaque', '2025-10-21', '2025-11-24'),
(10, 'María Gamez', '2025-10-11', '2025-11-01');

CREATE TABLE directores(
id SERIAL PRIMARY KEY,
nombre VARCHAR(100));

INSERT INTO directores (nombre) VALUES
('Sam Flynn'),
('Quorra'),
('Yakuza'),
('Will'),
('Lord Farkuar'),
('Bruce Willis'),
('Farruk Bulsara'),
('Espiritus Chocarreros'),
('Lindsay'),
('Williams Brothers'),
('Unknown'),
('Brendan Freaser'),
('Florence Pugh'),
('Elton John');

ALTER TABLE peliculas  ADD COLUMN director_id INT REFERENCES directores(id);



CREATE TABLE pelis(
id SERIAL PRIMARY KEY,
titulo VARCHAR(200),
director_id INT REFERENCES directores(id),
isbn VARCHAR(20) UNIQUE,
precio DECIMAL(10,2),
temas TEXT[],
info_adicional JSONB
);

INSERT INTO pelis (titulo, director_id, isbn, precio, temas,
info_adicional) VALUES
('TRON:LEGACY', 1, '978-0060883287', 24.00,
ARRAY['Ciencia ficcion', 'USA'],
'{"duracion": 120, "año_publicacion": 2010,
"idioma_original": "ingles"}'),
('TRON:ARES', 2, '978-1501117015', 20.00,
ARRAY['Ciencia ficcion', 'USA'],
'{"duracion": 120, "año_publicacion": 2025,
"idioma_original": "ingles"}'),
('HACHIKO', 3, '978-150111712', 20.00,
ARRAY['DRAMA', 'USA'],
'{"duracion": 110, "año_publicacion": 2009,
"idioma_original": "ingles"}'),
('Manos Milagrosas', 4, '978-1501117011', 20.00,
ARRAY['Religion', 'USA'],
'{"duracion": 120, "año_publicacion": 2007,
"idioma_original": "ingles"}'),
('Shrek', 5, '978-1501117013', 20.00,
ARRAY['Animacion', 'USA'],
'{"duracion": 120, "año_publicacion": 2001,
"idioma_original": "ingles"}'),
('Duro de matar', 6, '978-1501117010', 20.00,
ARRAY['Accion', 'USA'],
'{"duracion": 120, "año_publicacion": 1980,
"idioma_original": "ingles"}'),
('Bohemian Rhapsody', 7, '978-1501117016', 20.00,
ARRAY['Biografica', 'USA'],
'{"duracion": 120, "año_publicacion": 2017,
"idioma_original": "ingles"}'),
('El conjuro', 8, '978-1501117017', 20.00,
ARRAY['Terror', 'USA'],
'{"duracion": 120, "año_publicacion": 2007,
"idioma_original": "ingles"}'),
('Herbie a toda marcha ', 9, '978-1501117018', 20.00,
ARRAY['Infantil', 'USA'],
'{"duracion": 120, "año_publicacion": 2004,
"idioma_original": "ingles"}'),
('White Chicks', 10, '978-1501117019', 20.00,
ARRAY['Comedia', 'USA'],
'{"duracion": 120, "año_publicacion": 2007,
"idioma_original": "ingles"}'),
('Scary Movie', 10, '978-1501117020', 20.00,
ARRAY['Parodia', 'USA'],
'{"duracion": 120, "año_publicacion": 2006,
"idioma_original": "ingles"}'),
('Cien pies Humano', 11, '978-1501117021', 20.00,
ARRAY['Gore', 'USA'],
'{"duracion": 120, "año_publicacion": 1999,
"idioma_original": "ingles"}'),
('Viaje al centro de la tierra', 12, '978-1501117022', 20.00,
ARRAY['Aventura ', 'USA'],
'{"duracion": 120, "año_publicacion": 2003,
"idioma_original": "ingles"}'),
('Encantada', 13, '978-1501117023', 20.00,
ARRAY['Romantica ', 'USA'],
'{"duracion": 120, "año_publicacion": 2010,
"idioma_original": "ingles"}'),
('Elton John', 14, '978-1501117024', 20.00,
ARRAY['Biografica', 'USA'],
'{"duracion": 120, "año_publicacion": 2025,
"idioma_original": "ingles"}'),
('TRON:ARES', 2, '978-1501117025', 20.00,
ARRAY['Ciencia ficcion', 'USA'],
'{"duracion": 120, "año_publicacion": 2025,
"idioma_original": "ingles"}');

create table usuarios (
id SERIAL primary key,
nombre VARCHAR(100));



CREATE TABLE Alquileres (
id SERIAL PRIMARY KEY,
pelicula_id INT REFERENCES pelis(id),
usuario VARCHAR(100),
fecha_prestamo DATE,
fecha_devolucion DATE
);

--  Consultas
SELECT d.nombre, COUNT(p.id) AS total_pelis, AVG(p.precio)
AS precio_promedio
FROM directores d  
LEFT JOIN pelis p ON d.id = p.directo_id;


