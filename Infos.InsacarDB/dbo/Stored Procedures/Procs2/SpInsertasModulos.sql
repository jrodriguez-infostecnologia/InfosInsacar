﻿CREATE PROCEDURE SpInsertasModulos @orden int,@activo bit,@codigo varchar(150),@descripcion varchar(250),@dirUrl varchar(950),@imagen varchar(950),@Retorno int output  AS begin tran sModulos insert sModulos( orden,activo,codigo,descripcion,dirUrl,imagen ) select @orden,@activo,@codigo,@descripcion,@dirUrl,@imagen if (@@error = 0 ) begin set @Retorno = 0 commit tran sModulos end else begin set @Retorno = 1 rollback tran sModulos end