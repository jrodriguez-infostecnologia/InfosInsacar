﻿CREATE PROCEDURE SpDeleteaSecciones @empresa int,@finca varchar(50),@codigo varchar(50),@Retorno int output  AS begin tran aSecciones delete aSecciones where codigo = @codigo and empresa = @empresa and finca = @finca if (@@error = 0 ) begin set @Retorno = 0 commit tran aSecciones end else begin set @Retorno = 1 rollback tran aSecciones end