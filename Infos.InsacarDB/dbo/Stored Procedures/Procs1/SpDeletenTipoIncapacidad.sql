﻿create PROCEDURE [dbo].[SpDeletenTipoIncapacidad] @empresa int,@codigo varchar(50),@Retorno int output  AS begin tran nTipoIncapacidad delete nTipoIncapacidad where empresa = @empresa and codigo = @codigo if (@@error = 0 ) begin set @Retorno = 0 commit tran nTipoIncapacidad end else begin set @Retorno = 1 rollback tran nTipoIncapacidad end