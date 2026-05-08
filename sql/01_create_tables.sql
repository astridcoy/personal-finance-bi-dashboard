IF NOT EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'FinanzasPersonales'
)
BEGIN
    CREATE DATABASE FinanzasPersonales;
END
GO


USE FinanzasPersonales;
GO


CREATE TABLE dbo.categorias (

    id_categoria INT IDENTITY(1,1) PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    tipo VARCHAR(20) NOT NULL

);
GO


CREATE TABLE dbo.movimientos (

    id_movimiento INT IDENTITY(1,1) PRIMARY KEY,

    fecha DATE NOT NULL,

    id_categoria INT NOT NULL,

    descripcion VARCHAR(255),

    monto DECIMAL(12,2) NOT NULL,

    CONSTRAINT FK_movimientos_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES dbo.categorias(id_categoria)

);
GO