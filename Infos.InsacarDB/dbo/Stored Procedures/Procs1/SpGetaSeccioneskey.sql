﻿CREATE PROCEDURE SpGetaSeccioneskey @empresa int,@finca varchar(50),@codigo varchar(50) AS  select * from aSecciones where codigo = @codigo and empresa = @empresa and finca = @finca