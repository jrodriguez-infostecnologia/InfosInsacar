﻿CREATE PROCEDURE SpInsertaiItemsCriterios @empresa int,@item int,@fechaRegistro datetime,@idPlan varchar(5),@idMayor varchar(50),@Retorno int output  AS begin tran iItemsCriterios insert iItemsCriterios( empresa,item,fechaRegistro,idPlan,idMayor ) select @empresa,@item,@fechaRegistro,@idPlan,@idMayor if (@@error = 0 ) begin set @Retorno = 0 commit tran iItemsCriterios end else begin set @Retorno = 1 rollback tran iItemsCriterios end