﻿CREATE PROCEDURE [dbo].[SpGetaSanidadDetallekey] @fecha date,@empresa int,@linea int,@palma int,@tipo varchar(50),@numero varchar(50),@lote varchar(50) AS  select * from aSanidadDetalle where empresa = @empresa and fecha = @fecha and linea = @linea and lote = @lote and numero = @numero and palma = @palma and tipo = @tipo