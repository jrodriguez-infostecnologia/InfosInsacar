﻿CREATE PROCEDURE [dbo].[SpInsertanPeriodo] @fechaInicial date,@empresa int,@año int,@periodosGenerado int,@diasPago int,@diasCorte int,@fechaRegistro datetime,@activo bit,@tipoNomina varchar(50),@usuario varchar(50),@Retorno int output  AS begin tran nPeriodo insert nPeriodo( fechaInicial,empresa,año,periodosGenerado,diasPago,diasCorte,fechaRegistro,activo,tipoNomina,usuario ) select @fechaInicial,@empresa,@año,@periodosGenerado,@diasPago,@diasCorte,@fechaRegistro,@activo,@tipoNomina,@usuario if (@@error = 0 ) begin set @Retorno = 0 commit tran nPeriodo end else begin set @Retorno = 1 rollback tran nPeriodo end