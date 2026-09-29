-- Proyecto: Vista de Top Ventas por Categoría para Business Intelligence
-- Objetivo: Encapsular lógica de funciones de ventana en una Vista para integración con Power BI.

CREATE OR REPLACE VIEW vw_top_ventas_por_categoria AS
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

-- Consulta de verificación
SELECT * FROM vw_top_ventas_por_categoria;