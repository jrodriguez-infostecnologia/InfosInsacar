﻿create PROCEDURE [dbo].[SpDeletenProgramacion] @fecha date,@turno varchar(50),@funcionario varchar(50), @empresa int, @Retorno int output  AS begin tran nProgramacion 
delete nProgramacion where fecha = @fecha and turno = @turno and funcionario = @funcionario and empresa=@empresa
if (@@error = 0 ) begin set @Retorno = 0 commit tran nProgramacion end else begin set @Retorno = 1 rollback tran nProgramacion end