﻿CREATE PROCEDURE SpActualizasModulos @orden int,@activo bit,@codigo varchar(150),@descripcion varchar(250),@dirUrl varchar(950),@imagen varchar(950),@Retorno int output  AS begin tran sModulos update sModulos set orden = @orden,activo = @activo,descripcion = @descripcion,dirUrl = @dirUrl,imagen = @imagen where codigo = @codigo if (@@error = 0 ) begin set @Retorno = 0 commit tran sModulos end else begin set @Retorno = 1 rollback tran sModulos end