﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de CestruturaCC
/// </summary>
public class CestruturaCC
{
	public CestruturaCC()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    ADInfos.AccesoDatos accesoDatos = new ADInfos.AccesoDatos();

    public DataView BuscarEntidad(string texto, int empresa)
    {
        DataView dvEntidad = accesoDatos.EntidadGet(
            "cEstructuraCCosto",
            "ppa").Tables[0].DefaultView;

        dvEntidad.RowFilter = "empresa =" + empresa + " and descripcion like '%" + texto + "%'";

        return dvEntidad;
    }


    public string Consecutivo(int empresa)
    {
        string[] iParametros = new string[] { "@empresa" };
        string[] oParametros = new string[] { "@consecutivo" };
        object[] objValores = new object[] { empresa };

        return Convert.ToString(accesoDatos.ExecProc(
            "spConsecutivoEstructuraCC",
            iParametros,
            oParametros,
            objValores,
            "ppa").GetValue(0));
    }

}