﻿create PROCEDURE [dbo].[SpGetnVacacionesDetallekey] @periodoInicial date,@periodoFinal date,@empresa int,@empleado int,@registro int AS  select * from nVacacionesDetalle where empleado = @empleado and empresa = @empresa and periodoFinal = @periodoFinal and periodoInicial = @periodoInicial and registro = @registro