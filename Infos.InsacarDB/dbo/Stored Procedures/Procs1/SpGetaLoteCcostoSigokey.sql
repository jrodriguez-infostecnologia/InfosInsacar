﻿create PROCEDURE [dbo].[SpGetaLoteCcostoSigokey] @empresa int,@lote varchar(50) AS  select * from aLoteCcostoSigo where empresa = @empresa and lote = @lote