SQL
-- Proyecto: Análisis de Desempeño Comercial (E-Commerce)
-- Objetivo: Filtrar categorías con descuento promedio mayor al 5%

SELECT 
    categoria,
    SUM(monto_total) AS total_ventas,
    COUNT(id_transaccion) AS total_transacciones,
    ROUND(AVG(monto_total), 2) AS ticket_promedio,
    ROUND(AVG(descuento_aplicado) * 100, 2) AS descuento_promedio_pct
FROM ventas_transacciones
GROUP BY categoria
HAVING AVG(descuento_aplicado) > 0.05
ORDER BY total_ventas DESC;