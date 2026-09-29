-- Proyecto: Top 2 Transacciones por Categoría (Funciones de Ventana)
-- Objetivo: Clasificar registros por grupo manteniendo el detalle individual mediante ROW_NUMBER() OVER().

WITH ranking_ventas AS (
    SELECT 
        id_transaccion,
        categoria,
        monto_total,
        fecha_venta,
        ROW_NUMBER() OVER (
            PARTITION BY categoria 
            ORDER BY monto_total DESC
        ) AS posicion_ranking
    FROM ventas_transacciones
)
SELECT 
    id_transaccion,
    categoria,
    monto_total,
    fecha_venta,
    posicion_ranking
FROM ranking_ventas
WHERE posicion_ranking <= 2
ORDER BY categoria, posicion_ranking;