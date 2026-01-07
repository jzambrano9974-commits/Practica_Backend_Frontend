-- BORRAR TODO PARA EMPEZAR LIMPIO
DROP TABLE IF EXISTS notas CASCADE;
DROP TABLE IF EXISTS estudiantes CASCADE;
DROP TABLE IF EXISTS materias CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

-- 1. TABLA USUARIOS (Docentes/Admin)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    clave VARCHAR(100) NOT NULL
);

-- 2. TABLA MATERIAS
CREATE TABLE materias (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- 3. TABLA ESTUDIANTES (Nueva)
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- 4. TABLA NOTAS (Nueva)
CREATE TABLE notas (
    id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES estudiantes(id) ON DELETE CASCADE,
    materia_id INT REFERENCES materias(id) ON DELETE CASCADE,
    valor DECIMAL(4, 2) CHECK (valor >= 0 AND valor <= 10),
    UNIQUE(estudiante_id, materia_id) -- Un estudiante solo tiene 1 nota por materia
);

-- DATOS DE PRUEBA
INSERT INTO materias (codigo, nombre) VALUES ('SIS-101', 'Programación'), ('MAT-200', 'Cálculo');
INSERT INTO estudiantes (cedula, nombre) VALUES ('070101', 'Ana Lopez'), ('070102', 'Carlos Vera');

SELECT * FROM usuarios;
SELECT * FROM materias;
SELECT * FROM estudiantes;
SELECT * FROM notas;
