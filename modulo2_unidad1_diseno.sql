CREATE DATABASE modulo2_unidad1_diseno;

CREATE TABLE Clientes (
id_cliente INT PRIMARY KEY,
Nombre VARCHAR (100) NOT NULL,
perfil_bio TEXT,
fecha_registro DATE
);

-- INT porque el identificador del cliente es un número entero.
-- INT porque el identificador del cliente es un número entero.
-- TEXT porque permite almacenar una biografía o notas de longitud variable.
-- DATE porque solo necesitamos almacenar la fecha de registro.

CREATE TABLE Productos (
id_producto INT PRIMARY KEY,
descripcion VARCHAR (255) NOT NULL,
precio DECIMAL (10,2),
esta_activo INT 
);

-- - id_producto: INT porque es un número entero que identifica al producto.
-- descripcion: VARCHAR(255) porque almacena texto de hasta 255 caracteres.
-- precio: DECIMAL(10,2) porque representa dinero y permite 2 decimales.
-- esta_activo: INT porque podemos usar 1 para activo y 0 para inactivo
