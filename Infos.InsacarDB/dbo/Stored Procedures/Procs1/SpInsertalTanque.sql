﻿CREATE PROCEDURE SpInsertalTanque @empresa int,@item int,@capacidad float,@activo bit,@descripcion varchar(950),@codigo char(5),@Retorno int output  AS begin tran lTanque insert lTanque( empresa,item,capacidad,activo,descripcion,codigo ) select @empresa,@item,@capacidad,@activo,@descripcion,@codigo if (@@error = 0 ) begin set @Retorno = 0 commit tran lTanque end else begin set @Retorno = 1 rollback tran lTanque end