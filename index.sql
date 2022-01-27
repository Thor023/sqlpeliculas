CREATE DATABASE peliculas;--Crear Base de datos peliculas
--Crear tabla de peliculas con atributos id,Pelicula,Año estreno,Director
CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR (120),
    año_estreno INT,
    director VARCHAR (25),
    PRIMARY KEY (id)
);
--Crear Tabla de Reparto 
CREATE TABLE reparto (
    id_peliculas INT,
    nombre VARCHAR(120),
    FOREIGN KEY (id_peliculas) REFERENCES peliculas(id)
);

-- Cargar ambos archivos a su tabla correspondiente. (1 Punto)

\COPY peliculas FROM 'C:\Users\m_didi\Desktop\BDD\Desafios\peliculas\peliculas.csv' csv header;
\COPY reparto FROM 'C:\Users\m_didi\Desktop\BDD\Desafios\peliculas\reparto.csv' csv;

-- Obtener el ID de la película “Titanic”. (1 Punto)

SELECT id FROM peliculas WHERE pelicula = 'Titanic';


-- Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)
SELECT COUNT (nombre) AS Apariciones_Harrison_Ford
from reparto
where nombre = 'Harrison Ford';


-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente. (1 punto)
SELECT pelicula, año_estreno from peliculas where año_estreno between 1990 and 1999 ORDER BY pelicula ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”. (1 punto)
SELECT pelicula, Length(pelicula) AS longitud_titulo FROM peliculas;


-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
-- (2 punto)

SELECT MAX( Length(pelicula)) AS titulo_mas_extenso FROM peliculas;






