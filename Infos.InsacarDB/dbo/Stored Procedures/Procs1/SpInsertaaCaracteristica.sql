﻿CREATE PROCEDURE [dbo].[SpInsertaaCaracteristica] @empresa int,@codigo int,@grupoCaracteristica int,@manejaCaractistica bit,@activo bit,@descripcion varchar(500),@Retorno int output  AS begin tran aCaracteristica insert aCaracteristica( empresa,codigo,grupoCaracteristica,manejaCaractistica,activo,descripcion ) select @empresa,@codigo,@grupoCaracteristica,@manejaCaractistica,@activo,@descripcion if (@@error = 0 ) begin set @Retorno = 0 commit tran aCaracteristica end else begin set @Retorno = 1 rollback tran aCaracteristica end