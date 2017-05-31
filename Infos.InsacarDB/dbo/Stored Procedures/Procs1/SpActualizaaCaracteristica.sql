﻿CREATE PROCEDURE [dbo].[SpActualizaaCaracteristica] @empresa int,@codigo int,@grupoCaracteristica int,@manejaCaractistica bit,@activo bit,@descripcion varchar(500),@Retorno int output  AS begin tran aCaracteristica update aCaracteristica set grupoCaracteristica = @grupoCaracteristica,manejaCaractistica = @manejaCaractistica,activo = @activo,descripcion = @descripcion where codigo = @codigo and empresa = @empresa if (@@error = 0 ) begin set @Retorno = 0 commit tran aCaracteristica end else begin set @Retorno = 1 rollback tran aCaracteristica end