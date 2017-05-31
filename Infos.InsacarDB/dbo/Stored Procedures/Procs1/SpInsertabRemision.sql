﻿CREATE PROCEDURE SpInsertabRemision @empresa int,@funcionarioAsignado int,@fechaCreacion datetime,@fechaImpresion datetime,@fechaAsignacion datetime,@codigo varchar(50),@usuario varchar(50),@estado char(1),@Retorno int output  AS begin tran bRemision insert bRemision( empresa,funcionarioAsignado,fechaCreacion,fechaImpresion,fechaAsignacion,codigo,usuario,estado ) select @empresa,@funcionarioAsignado,@fechaCreacion,@fechaImpresion,@fechaAsignacion,@codigo,@usuario,@estado if (@@error = 0 ) begin set @Retorno = 0 commit tran bRemision end else begin set @Retorno = 1 rollback tran bRemision end