﻿CREATE TABLE [dbo].[nEntidadAfc] (
    [empresa]        INT            NOT NULL,
    [codigo]         VARCHAR (50)   NOT NULL,
    [descripcion]    VARCHAR (550)  NOT NULL,
    [tercero]        INT            NULL,
    [proveedor]      VARCHAR (50)   NULL,
    [codigoNacional] VARCHAR (50)   NULL,
    [activo]         BIT            NOT NULL,
    [observacion]    VARCHAR (5550) NOT NULL,
    [fechaRegistro]  DATETIME       NOT NULL,
    [usuario]        VARCHAR (50)   NOT NULL,
    [cuenta]         VARCHAR (50)   NULL,
    CONSTRAINT [PK_nAfc] PRIMARY KEY CLUSTERED ([empresa] ASC, [codigo] ASC),
    CONSTRAINT [FK_nEntidadAfc_cTercero] FOREIGN KEY ([empresa], [tercero]) REFERENCES [dbo].[cTercero] ([empresa], [id])
);

