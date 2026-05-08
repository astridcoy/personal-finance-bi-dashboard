USE FinanzasPersonales;
GO


CREATE VIEW dbo.vw_movimientos AS

SELECT

    m.id_movimiento,
    m.fecha,
    c.nombre AS categoria,
    c.tipo,
    m.descripcion,
    m.monto

FROM dbo.movimientos m

INNER JOIN dbo.categorias c
    ON m.id_categoria = c.id_categoria;
GO