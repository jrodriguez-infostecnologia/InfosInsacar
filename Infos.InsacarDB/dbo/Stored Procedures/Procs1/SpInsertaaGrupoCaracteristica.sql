﻿CREATE PROCEDURE [dbo].[SpInsertaaGrupoCaracteristica] @empresa int,@codigo int,@activo bit,@descripcion varchar(500),@Retorno int output  AS begin tran aGrupoCaracteristica insert aGrupoCaracteristica( empresa,codigo,activo,descripcion ) select @empresa,@codigo,@activo,@descripcion if (@@error = 0 ) begin set @Retorno = 0 commit tran aGrupoCaracteristica end else begin set @Retorno = 1 rollback tran aGrupoCaracteristica end