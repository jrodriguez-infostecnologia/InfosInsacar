﻿CREATE PROCEDURE [dbo].[SpGetaCaracteristicakey] @empresa int,@codigo int AS  select * from aCaracteristica where codigo = @codigo and empresa = @empresa