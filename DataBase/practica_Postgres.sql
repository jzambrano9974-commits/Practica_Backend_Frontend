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

-- 3. TABLA ESTUDIANTES
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- 4. TABLA NOTAS
CREATE TABLE notas (
    id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES estudiantes(id) ON DELETE CASCADE,
    materia_id INT REFERENCES materias(id) ON DELETE CASCADE,
    valor DECIMAL(4, 2) CHECK (valor >= 0 AND valor <= 10),
    UNIQUE(estudiante_id, materia_id) -- Un estudiante solo tiene 1 nota por materia
);

-- =============================================
-- DATOS DE PRUEBA
-- =============================================

-- MATERIAS
INSERT INTO materias (codigo, nombre) VALUES 
('SIS-101', 'Fundamentos de Programación'),
('MAT-100', 'Cálculo Diferencial'),
('SIS-201', 'Programación Orientada a Objetos'),
('SIS-202', 'Bases de Datos I'),
('SIS-301', 'Estructura de Datos'),
('SIS-302', 'Sistemas Operativos'),
('RED-400', 'Redes de Computadoras'),
('SIS-405', 'Ingeniería de Software'),
('SIS-501', 'Desarrollo Web'),
('SIS-600', 'Gestión de Bases de Datos Distribuidas');

-- ESTUDIANTES
INSERT INTO estudiantes (cedula, nombre) VALUES 
('1310203040', 'Juan Zambrano'),      
('1350607080', 'Maria Cedeño'),       
('1305556667', 'Pedro Loor'),         
('1312345678', 'Ana Mendoza'),
('1398765432', 'Luis Moreira'),
('0911223344', 'Sofia Guadamud'),     
('1722334455', 'Carlos Intriago'),    
('1301010101', 'Fernanda Velez'),
('1302020202', 'Jorge Macias'),
('1309090909', 'Elena Saltos');


-- VERIFICACIÓN RÁPIDA
SELECT * FROM usuarios;
SELECT * FROM materias;
SELECT * FROM estudiantes;
SELECT * FROM notas;