﻿CREATE PROCEDURE SpGetiBodegakey @empresa int,@codigo varchar(5) AS  select * from iBodega where codigo = @codigo and empresa = @empresa