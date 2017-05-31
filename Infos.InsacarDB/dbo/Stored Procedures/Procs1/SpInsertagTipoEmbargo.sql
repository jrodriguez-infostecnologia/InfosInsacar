﻿create PROCEDURE [dbo].[SpInsertagTipoEmbargo] @empresa int,@activo bit,@codigo varchar(50),@descripcion varchar(250),@Retorno int output  AS begin tran gTipoEmbargo insert gTipoEmbargo( empresa,activo,codigo,descripcion ) select @empresa,@activo,@codigo,@descripcion if (@@error = 0 ) begin set @Retorno = 0 commit tran gTipoEmbargo end else begin set @Retorno = 1 rollback tran gTipoEmbargo end