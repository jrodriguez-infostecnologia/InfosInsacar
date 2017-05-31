﻿create PROCEDURE [dbo].[spEditaEncabezadoNovedades] @fecha date,@empresa int,@tipo varchar(50),@numero varchar(50),@remision varchar(50),
@ccosto varchar(50),@empleado varchar(50),@concepto varchar(50),@observacion varchar(2000),@Retorno int output  AS begin tran nNovedades 
update nNovedades set fecha = @fecha, remision = @remision,ccosto = @ccosto,empleado = @empleado,
concepto = @concepto,observacion = @observacion
where empresa = @empresa and tipo = @tipo and numero = @numero if (@@error = 0 ) begin set @Retorno = 0 commit tran nNovedades end 
else begin set @Retorno = 1 rollback tran nNovedades end