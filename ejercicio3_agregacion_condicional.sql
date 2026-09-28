-- Proyecto: Desglose de Ingresos Promocionales vs Precio Lista (Agregación Condicional)
-- Objetivo: Evaluar la dependencia promocional por categoría mediante SUM(CASE WHEN...).

SELECT 
    categoria,
    SUM(CASE WHEN descuento_aplicado > 0 THEN monto_total ELSE 0 END) AS ingresos_con_descuento,
    SUM(CASE WHEN descuento_aplicado = 0 THEN monto_total ELSE 0 END) AS ingresos_sin_descuento,
    SUM(monto_total) AS total_general
FROM ventas_transacciones
GROUP BY categoria
ORDER BY total_general DESC;