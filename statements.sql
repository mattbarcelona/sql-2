/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

-- PASO 3
-- Tu código aquí
ALTER TABLE roles ADD COLUMN id_rol INT; 
UPDATE usuarios set id_rol (SELECT id_rol FROM roles ORDER BY rand() LIMIT 1);
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol FROM usuarios INNER_JOIN roles ON usuarios.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoría VARCHAR(100) NOT NULL
);

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_categoria INT; 

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (6, 10);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (3, 7, 11);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (4, 8);
UPDATE usuarios SET id_categoria = 5 WHERE id_usuario IN (12);
UPDATE usuarios SET id_categoria = 6 WHERE id_usuario IN (14, 13);
UPDATE usuarios SET id_categoria = 7 WHERE id_usuario IN (15, 16);
UPDATE usuarios SET id_categoria = 8 WHERE id_usuario IN (17, 18);
UPDATE usuarios SET id_categoria = 9 WHERE id_usuario IN (19, 20);
UPDATE usuarios SET id_categoria = 10 WHERE id_usuario IN (2);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria 
  FROM usuarios 
  JOIN categorias ON usuarios.id_categoria = categorias.id_categoria
  JOIN roles ON usuarios.id_rol = roles.id_rol; 

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoría INT
);

ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoría) REFERENCES categorias(id_categoría);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoría) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10)

-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol;
JOIN categorías ON usuarios.id_categoria = categorías.id_categoria;
JOIN usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario;
