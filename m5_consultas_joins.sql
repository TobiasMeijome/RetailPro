-- M5 - CONSULTAS CON JOINS
-- RetailPro
-- Consulta 1 - Vista base del proyecto

USE Ventas_Tech_DB

SELECT
    fecha_venta,
    ventas.id_cliente,
    c.nombre AS Cliente,
    p.nombre_producto AS Producto,
    cat.nombre_categoria AS Categoria,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS total_venta
FROM ventas
INNER JOIN clientes AS c
ON ventas.id_cliente = c.id_cliente
INNER JOIN productos AS p
ON ventas.id_producto = p.id_producto
INNER JOIN categorias AS cat
ON p.id_categoria = cat.id_categoria;

--Consulta 2 — Clientes sin ventas (LEFT JOIN)

SELECT 
c.nombre,
c.fecha_registro,
c.email
FROM clientes AS c
LEFT JOIN ventas AS v
ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


--Consulta 3 — Productos sin ventas (LEFT JOIN) 

SELECT 
p.nombre_producto,
p.precio,
p.id_categoria
FROM productos AS p
LEFT JOIN ventas AS v
ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;


--Consulta 4 — Consolidado por canal (UNION ALL)

SELECT 
fecha_venta,
cantidad * precio_unitario AS total,
'Online' AS canal
FROM ventas
WHERE fecha_venta < '2024-03-13'

UNION ALL

SELECT
fecha_venta,
cantidad * precio_unitario AS total,
'Presencial' AS canal
FROM ventas
WHERE fecha_venta >= '2024-03-13'

SELECT
canal,
SUM (total) AS total_ventas
FROM (
SELECT 
fecha_venta,
cantidad * precio_unitario AS total,
'Online' AS canal
FROM ventas
WHERE fecha_venta < '2024-03-13'

UNION ALL

SELECT
fecha_venta,
cantidad * precio_unitario AS total,
'Presencial' AS canal
FROM ventas
WHERE fecha_venta >= '2024-03-13'
) AS ventas_consolidadas
GROUP BY canal;


