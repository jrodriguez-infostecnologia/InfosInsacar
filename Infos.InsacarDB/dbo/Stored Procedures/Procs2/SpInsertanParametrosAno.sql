﻿CREATE PROCEDURE [dbo].[SpInsertanParametrosAno] @empresa int,@ano int,@noSueldoST int,@vSalarioMinimo money,@vAuxilioTransporte money,@vUVT money,@vPatrimonioBruto money,@vIngresoBruto money,@vMaximoExento money,@vUVT3 money,@vUVT4 money,@vUVT5 money,@vUVT6 money,@vMinimoPeriodo money,@vMaxPagoSalud money,@vMaxAporteAFC money,@vMaxDeducibleVivienda money,@vDependientes money,@vMinimoingresosDeclarante money,@vUVT1 money,@vUVT2 money,@fechaRegistro datetime,@cAplicarArt385 bit,@cSalarioIntegral bit,@cRestaIncapacidad bit,@cDiasTNL bit,@pExentoRetencion decimal,@pMaximoaportePension decimal,@pExentoSalario1393 decimal,@pDependientes decimal,@usuario varchar(30),@observacion varchar(5000),@Retorno int output  AS begin tran nParametrosAno insert nParametrosAno( empresa,ano,noSueldoST,vSalarioMinimo,vAuxilioTransporte,vUVT,vPatrimonioBruto,vIngresoBruto,vMaximoExento,vUVT3,vUVT4,vUVT5,vUVT6,vMinimoPeriodo,vMaxPagoSalud,vMaxAporteAFC,vMaxDeducibleVivienda,vDependientes,vMinimoingresosDeclarante,vUVT1,vUVT2,fechaRegistro,cAplicarArt385,cSalarioIntegral,cRestaIncapacidad,cDiasTNL,pExentoRetencion,pMaximoaportePension,pExentoSalario1393,pDependientes,usuario,observacion ) select @empresa,@ano,@noSueldoST,@vSalarioMinimo,@vAuxilioTransporte,@vUVT,@vPatrimonioBruto,@vIngresoBruto,@vMaximoExento,@vUVT3,@vUVT4,@vUVT5,@vUVT6,@vMinimoPeriodo,@vMaxPagoSalud,@vMaxAporteAFC,@vMaxDeducibleVivienda,@vDependientes,@vMinimoingresosDeclarante,@vUVT1,@vUVT2,@fechaRegistro,@cAplicarArt385,@cSalarioIntegral,@cRestaIncapacidad,@cDiasTNL,@pExentoRetencion,@pMaximoaportePension,@pExentoSalario1393,@pDependientes,@usuario,@observacion if (@@error = 0 ) begin set @Retorno = 0 commit tran nParametrosAno end else begin set @Retorno = 1 rollback tran nParametrosAno end