﻿CREATE PROCEDURE [dbo].[SpGetaGrupoCaracteristicakey] @empresa int,@codigo int AS  select * from aGrupoCaracteristica where codigo = @codigo and empresa = @empresa