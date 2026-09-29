-- Proyecto: Limpieza de Datos y Manejo de Nulos (COALESCE & NULLIF)
-- Objetivo: Garantizar la integridad de cálculos matemáticos evitando valores nulos y errores de división por cero.

SELECT 
    id_transaccion,
    categoria,
    monto_total,
    -- 1. Reemplazamos NULOS en descuento_aplicado por 0.00
    COALESCE(descuento_aplicado, 0.00) AS descuento_limpio,
    
    -- 2. Convertimos 0 a NULL para evitar divisiones por cero
    ROUND(
        monto_total / NULLIF(COALESCE(descuento_aplicado, 0.00), 0.00), 
        2
    ) AS ratio_monto_vs_descuento
FROM ventas_transacciones;