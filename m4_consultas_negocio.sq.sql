USE Ventas_Tech_DB

--Consulta 1  Resumen Ejecutivo Mensual

SELECT 
MONTH (fecha_venta) AS Mes,
SUM (cantidad * precio_unitario) AS total_facturado,
COUNT (*) AS cantidad_pedidos,
AVG (cantidad * precio_unitario)  AS ticket_promedio
FROM ventas
GROUP BY MONTH (fecha_venta)
ORDER BY Mes;

-- CONSULTA 2 Ranking De Productos

SELECT 
TOP 5 id_producto,
SUM (cantidad) AS unidades_vendidas,
SUM (cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


--CONSULTA 3 Clientes Recurrentes

SELECT
id_cliente,
COUNT (*) AS cantidad_pedidos,
SUM (cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1


-- CONSULTA 4 Meses por encima/por debajo del promedio 

SELECT 
MONTH (fecha_venta) AS Mes,
SUM (cantidad * precio_unitario) AS total_facturado,
CASE 
WHEN SUM (cantidad*precio_unitario) > (
SELECT AVG(total_facturado)
FROM (
SELECT
MONTH(fecha_venta) AS Mes,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY MONTH (fecha_venta)
) AS tabla_meses
)
THEN 'Por encima'
ELSE 'Por debajo'
END AS comparacion
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes;


-- HALLAZGOS
-- 1. El producto 1 generó la mayor facturación, alcanzando $3600.
-- 2. Todos los clientes recurrentes identificados realizaron exactamente 2 pedidos pero el que mas gasto fue el cliente 1
-- 3. El producto 2 fue el producto con mayor cantidad de unidades vendidas, con 13 unidades.





    
