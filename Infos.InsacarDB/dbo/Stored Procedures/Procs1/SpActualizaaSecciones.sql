﻿CREATE PROCEDURE SpActualizaaSecciones @empresa int,@activo bit,@hBrutas decimal,@finca varchar(50),@codigo varchar(50),@descripcion varchar(550),@Retorno int output  AS begin tran aSecciones update aSecciones set activo = @activo,hBrutas = @hBrutas,descripcion = @descripcion where codigo = @codigo and empresa = @empresa and finca = @finca if (@@error = 0 ) begin set @Retorno = 0 commit tran aSecciones end else begin set @Retorno = 1 rollback tran aSecciones end