USE FinanzasPersonales;
GO


CREATE PROCEDURE dbo.sp_insertar_movimiento

    @fecha DATE,
    @categoria INT,
    @descripcion VARCHAR(255),
    @monto DECIMAL(12,2)

AS

BEGIN

    INSERT INTO dbo.movimientos (

        fecha,
        id_categoria,
        descripcion,
        monto

    )

    VALUES (

        @fecha,
        @categoria,
        @descripcion,
        @monto

    );

END
GO