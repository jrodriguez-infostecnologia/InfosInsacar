﻿CREATE PROCEDURE SpActualizacxpProveedorCalseIR @empresa int,@tercero int,@clase int,@proveedor varchar(10),@concepto varchar(5),@Retorno int output  AS begin tran cxpProveedorCalseIR update cxpProveedorCalseIR set concepto = @concepto where clase = @clase and empresa = @empresa and proveedor = @proveedor and tercero = @tercero if (@@error = 0 ) begin set @Retorno = 0 commit tran cxpProveedorCalseIR end else begin set @Retorno = 1 rollback tran cxpProveedorCalseIR end