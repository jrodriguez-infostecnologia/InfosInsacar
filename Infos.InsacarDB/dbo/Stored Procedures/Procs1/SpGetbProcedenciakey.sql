﻿CREATE PROCEDURE SpGetbProcedenciakey @empresa int,@codigo varchar(50) AS  select * from bProcedencia where codigo = @codigo and empresa = @empresa