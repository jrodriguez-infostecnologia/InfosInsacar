﻿create PROCEDURE [dbo].[SpGetnFestivokey] @fecha date,@empresa int AS  select * from nFestivo where empresa = @empresa and fecha = @fecha