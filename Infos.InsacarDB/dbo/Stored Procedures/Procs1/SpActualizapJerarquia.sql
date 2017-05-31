﻿
CREATE PROCEDURE [dbo].[SpActualizapJerarquia] @codigo int,@empresa int,@hijo int,@padre int,@nivel int,@activo bit,@descripcion varchar(250),@Retorno int output  AS begin tran pJerarquia update pJerarquia set hijo = @hijo,padre = @padre,nivel = @nivel,activo = @activo,descripcion = @descripcion where codigo = @codigo and empresa=@empresa if (@@error = 0 ) begin set @Retorno = 0 commit tran pJerarquia end else begin set @Retorno = 1 rollback tran pJerarquia end