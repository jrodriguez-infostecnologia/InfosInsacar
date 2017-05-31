﻿CREATE PROCEDURE [dbo].[SpInsertanTipoConcepto] @empresa int,@activo bit,@codigo varchar(50),@descripcion varchar(550),@Retorno int output  AS begin tran nTipoConcepto insert nTipoConcepto( empresa,activo,codigo,descripcion ) select @empresa,@activo,@codigo,@descripcion if (@@error = 0 ) begin set @Retorno = 0 commit tran nTipoConcepto end else begin set @Retorno = 1 rollback tran nTipoConcepto end