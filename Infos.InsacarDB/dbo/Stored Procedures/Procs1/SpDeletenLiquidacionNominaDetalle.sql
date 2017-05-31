﻿CREATE PROCEDURE [dbo].[SpDeletenLiquidacionNominaDetalle] @empresa int,@año int,@mes int,@noPeriodo int,@tipo varchar(50),@numero varchar(50),@Retorno int output  AS begin tran nLiquidacionNominaDetalle delete nLiquidacionNominaDetalle where año = @año and empresa = @empresa and mes = @mes and noPeriodo = @noPeriodo and numero = @numero and tipo = @tipo if (@@error = 0 ) begin set @Retorno = 0 commit tran nLiquidacionNominaDetalle end else begin set @Retorno = 1 rollback tran nLiquidacionNominaDetalle end