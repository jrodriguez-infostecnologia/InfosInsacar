﻿CREATE PROCEDURE SpGetbProcedenciaCorreoskey @empresa int,@procedencia varchar(50),@direccion varchar(250) AS  select * from bProcedenciaCorreos where direccion = @direccion and empresa = @empresa and procedencia = @procedencia