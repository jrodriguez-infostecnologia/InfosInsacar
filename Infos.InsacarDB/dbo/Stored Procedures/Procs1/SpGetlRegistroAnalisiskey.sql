﻿CREATE PROCEDURE SpGetlRegistroAnalisiskey @empresa int,@tipo varchar(50),@numero varchar(50),@analisis varchar(10) AS  select * from lRegistroAnalisis where analisis = @analisis and empresa = @empresa and numero = @numero and tipo = @tipo