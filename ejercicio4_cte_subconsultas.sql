-- Proyecto: Identificación de Ventas Sobre el Promedio por Categoría (CTE)
-- Objetivo: Calcular la media por categoría en un CTE y filtrar transacciones excepcionales.

WITH promedio_por_categoria AS (
    SELECT 
        categoria,
        AVG(monto_total) AS avg_ticket_cat
    FROM ventas_transacciones
    GROUP BY categoria
)
SELECT 
    v.id_transaccion,
    v.categoria,
    v.monto_total,
    ROUND(p.avg_ticket_cat, 2) AS promedio_categoria,
    ROUND(v.monto_total - p.avg_ticket_cat, 2) AS diferencia_vs_promedio
FROM ventas_transacciones v
JOIN promedio_por_categoria p ON v.categoria = p.categoria
WHERE v.monto_total > p.avg_ticket_cat
ORDER BY diferencia_vs_promedio DESC;