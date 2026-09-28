-- Proyecto: Segmentación de Transacciones E-Commerce (CASE WHEN)
-- Objetivo: Clasificar ventas según rango de monto total y analizar su impacto en ingresos.

SELECT 
    CASE 
        WHEN monto_total >= 200000 THEN 'Alto Valor'
        WHEN monto_total >= 50000 THEN 'Valor Medio'
        ELSE 'Bajo Valor'
    END AS segmento_ticket,
    COUNT(id_transaccion) AS cantidad_ventas,
    SUM(monto_total) AS ingreso_total,
    ROUND(AVG(monto_total), 2) AS ticket_promedio
FROM ventas_transacciones
GROUP BY 1
ORDER BY ingreso_total DESC;