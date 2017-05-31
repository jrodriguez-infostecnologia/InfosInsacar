﻿
CREATE PROCEDURE [dbo].[SpInsertanLiquidacionNomina] @empresa int,@año int,@mes int,@noPeriodo int,@estado int,@fecha datetime,@fechaRegistro datetime,@anulado bit,@usuarioAnulado varchar(50),@cerrado bit,@tipo varchar(50),@numero varchar(50),@usuario varchar(50),@observacion varchar(8000),@Retorno int output  AS begin tran nLiquidacionNomina insert nLiquidacionNomina( empresa,año,mes,noPeriodo,estado,fecha,fechaRegistro,anulado,usuarioAnulado,cerrado,tipo,numero,usuario,observacion ) select @empresa,@año,@mes,@noPeriodo,@estado,@fecha,@fechaRegistro,@anulado,@usuarioAnulado,@cerrado,@tipo,@numero,@usuario,@observacion 

insert nLiquidacionNominaDetalle( empresa,año,mes,noPeriodo,registro,empleado,signo,valor,saldo,cantidad,tipo,numero,concepto )
select @empresa, @año, @mes, @noPeriodo,ROW_NUMBER() OVER(ORDER BY tercero DESC), tercero,signo,valor,saldo,cantidad,@tipo, @numero,concepto  from tmpliquidacionNomina
if (@@error = 0 ) begin set @Retorno = 0 commit tran nLiquidacionNomina end else begin set @Retorno = 1 rollback tran nLiquidacionNomina end