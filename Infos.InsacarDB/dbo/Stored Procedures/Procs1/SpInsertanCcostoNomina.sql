﻿CREATE PROCEDURE [dbo].[SpInsertanCcostoNomina] @empresa int,@activo bit,@codigo varchar(50),@descripcion varchar(150),@Retorno int output  AS begin tran nCcostoNomina insert nCcostoNomina( empresa,activo,codigo,descripcion ) select @empresa,@activo,@codigo,@descripcion if (@@error = 0 ) begin set @Retorno = 0 commit tran nCcostoNomina end else begin set @Retorno = 1 rollback tran nCcostoNomina end