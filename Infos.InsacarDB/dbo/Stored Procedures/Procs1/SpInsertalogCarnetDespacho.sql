﻿CREATE PROCEDURE SpInsertalogCarnetDespacho @empresa int,@codigo varchar(50),@estado char(1),@Retorno int output  AS begin tran logCarnetDespacho insert logCarnetDespacho( empresa,codigo,estado ) select @empresa,@codigo,@estado if (@@error = 0 ) begin set @Retorno = 0 commit tran logCarnetDespacho end else begin set @Retorno = 1 rollback tran logCarnetDespacho end