﻿create PROCEDURE [dbo].[SpDeletegTipoLiquidacion] @codigo int,@empresa int,@Retorno int output  AS begin tran gTipoLiquidacion delete gTipoLiquidacion where codigo = @codigo and empresa = @empresa if (@@error = 0 ) begin set @Retorno = 0 commit tran gTipoLiquidacion end else begin set @Retorno = 1 rollback tran gTipoLiquidacion end