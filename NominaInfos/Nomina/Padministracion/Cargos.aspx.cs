using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Facturacion_Padministracion_Clientes1 : System.Web.UI.Page
{
    #region Instancias

    
    SeguridadInfos.Security seguridad = new SeguridadInfos.Security();
    CIP ip = new CIP();

    Ccargos cargos = new Ccargos();

    #endregion Instancias

    #region Metodos

    protected string nombrePaginaActual()
    {
        string[] arrResult = HttpContext.Current.Request.RawUrl.Split('/');
        string result = arrResult[arrResult.GetUpperBound(0)];
        arrResult = result.Split('?');
        return arrResult[arrResult.GetLowerBound(0)];
    }

    private void GetEntidad()
    {
        try
        {
            if (seguridad.VerificaAccesoOperacion(this.Session["usuario"].ToString(),
                                    ConfigurationManager.AppSettings["Modulo"].ToString(),
                                     nombrePaginaActual(), "C", Convert.ToInt16(Session["empresa"])) == 0)
            {
                ManejoError("Usuario no autorizado para ejecutar esta operaci�n", "C");
                return;
            }

            this.gvLista.DataSource = cargos.BuscarEntidad(nitxtBusqueda.Text, Convert.ToInt16(Session["empresa"]));
            this.gvLista.DataBind();

            this.nilblInformacion.Text = this.gvLista.Rows.Count.ToString() + " Registros encontrados";

            seguridad.InsertaLog(
                this.Session["usuario"].ToString(), "C",
              ConfigurationManager.AppSettings["Modulo"].ToString() + '-' + this.Page.ToString(), "ex",
                this.gvLista.Rows.Count.ToString() + " Registros encontrados", ip.ObtenerIP(), Convert.ToInt16(Session["empresa"]));

        }
        catch (Exception ex)
        {
            ManejoError("Error al cargar la tabla correspondiente a: " + ex.Message, "C");
        }
    }

    private void ManejoError(string error, string operacion)
    {
        this.Session["error"] = error;
        this.Session["paginaAnterior"] = this.Page.Request.FilePath.ToString();

        seguridad.InsertaLog(
            this.Session["usuario"].ToString(),
            operacion,
            ConfigurationManager.AppSettings["Modulo"].ToString() + '-' + this.Page.ToString(),
            "er",
            error, ip.ObtenerIP(), Convert.ToInt16(Session["empresa"]));

        this.Response.Redirect("~/Nomina/Error.aspx", false);
    }

    private void ManejoExito(string mensaje, string operacion)
    {
        this.nilblInformacion.Text = mensaje;

        CcontrolesUsuario.InhabilitarControles(
            this.Page.Controls);
        CcontrolesUsuario.LimpiarControles(
            this.Page.Controls);

        this.nilbNuevo.Visible = true;

        seguridad.InsertaLog(
            this.Session["usuario"].ToString(),
            operacion,
            ConfigurationManager.AppSettings["Modulo"].ToString() + '-' + this.Page.ToString(),
            "ex",
            mensaje, ip.ObtenerIP(), Convert.ToInt16(Session["empresa"]));

        GetEntidad();
    }

    private void CargarCombos()
    {

        try
        {

            this.ddlJefeInmediato.DataSource = CcontrolesUsuario.OrdenarEntidadyActivos(CentidadMetodos.EntidadGet("nCargo", "ppa"), "descripcion", Convert.ToInt16(this.Session["empresa"])); ;
            this.ddlJefeInmediato.DataValueField = "codigo";
            this.ddlJefeInmediato.DataTextField = "descripcion";
            this.ddlJefeInmediato.DataBind();
            this.ddlJefeInmediato.Items.Insert(0, new ListItem("", ""));
        }
        catch (Exception ex)
        {
            ManejoError("Error al cargar c�digo nacional de ocupaci�n. Correspondiente a: " + ex.Message, "C");
        }

        try
        {

            this.ddlJefeInmediato.DataSource = CcontrolesUsuario.OrdenarEntidadyActivos(CentidadMetodos.EntidadGet("nCargo", "ppa"), "descripcion", Convert.ToInt16(this.Session["empresa"])); ;
            this.ddlJefeInmediato.DataValueField = "codigo";
            this.ddlJefeInmediato.DataTextField = "descripcion";
            this.ddlJefeInmediato.DataBind();
            this.ddlJefeInmediato.Items.Insert(0, new ListItem("", ""));
        }
        catch (Exception ex)
        {
            ManejoError("Error al cargar cargos. Correspondiente a: " + ex.Message, "C");
        }
    }

    private void EntidadKey()
    {
        object[] objKey = new object[] { this.txtCodigo.Text.Trim().ToString(), Convert.ToInt16(Session["empresa"]) };
        try
        {
            if (CentidadMetodos.EntidadGetKey(
                "nCargo",
                "ppa",
                objKey).Tables[0].Rows.Count > 0)
            {
                this.nilblInformacion.Visible = true;
                this.nilblInformacion.Text = "C�digo " + this.txtCodigo.Text + " ya se encuentra registrado";

                CcontrolesUsuario.InhabilitarControles(
                    this.Page.Controls);

                this.nilbNuevo.Visible = true;
            }
        }
        catch (Exception ex)
        {
            ManejoError("Error al validar la llave primaria correspondiente a: " + ex.Message, "C");
        }
    }

    private void Guardar()
    {
        string operacion = "inserta", jefe = null,CNO = null;


        if (this.txtDescripcion.Text.Length == 0 || this.txtCodigo.Text.Length == 0)
        {
            this.nilblInformacion.Text = "Campos vacios por favor corrija";
        }
        else
        {
            try
            {

                if (ddlJefeInmediato.SelectedValue.Length != 0)
      
                    jefe = ddlJefeInmediato.SelectedValue;
                else
                    jefe = null;

                if (ddlCNO.SelectedValue.Length != 0)

                    CNO = ddlCNO.SelectedValue;
                else
                    CNO = null;
              

                string codigo = cargos.Consecutivo(Convert.ToInt16(Session["empresa"]));

                if (Convert.ToBoolean(this.Session["editar"]) == true)
                {
                    operacion = "actualiza";
                    codigo = txtCodigo.Text;
                }


                object[] objValores = new object[]{
                    chkActivo.Checked,
                    CNO,
                    codigo,
                    this.txtDescripcion.Text,
                   Convert.ToInt16(Session["empresa"]),
                   jefe,
                   txtObservacion.Text,
                   Convert.ToDecimal(txvSalario.Text)
                    
                };

                switch (CentidadMetodos.EntidadInsertUpdateDelete(
                    "nCargo",
                    operacion,
                    "ppa",
                    objValores))
                {
                    case 0:

                        ManejoExito("Datos insertados satisfactoriamente", operacion.Substring(0, 1).ToUpper());
                        break;

                    case 1:

                        ManejoError("Errores al insertar el registro. Operaci�n no realizada", operacion.Substring(0, 1).ToUpper());
                        break;
                }
            }
            catch (Exception ex)
            {
                ManejoError("Error al guardar los datos correspondiente a: " + ex.Message, operacion.Substring(0, 1).ToUpper());
            }
        }
    }

    #endregion Metodos

    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["usuario"] == null)
        {
            this.Response.Redirect("~/Inicio.aspx");
        }
        else
        {
            if (seguridad.VerificaAccesoPagina(this.Session["usuario"].ToString(),
                ConfigurationManager.AppSettings["Modulo"].ToString(), nombrePaginaActual(), Convert.ToInt16(Session["empresa"])) != 0)
            {


                this.txtCodigo.Focus();

            }
            else
            {
                ManejoError("Usuario no autorizado para ingresar a esta p�gina", "IN");
            }
        }
    }



    protected void lbNuevo_Click(object sender, ImageClickEventArgs e)
    {
        if (seguridad.VerificaAccesoOperacion(this.Session["usuario"].ToString(),
                             ConfigurationManager.AppSettings["Modulo"].ToString(),
                              nombrePaginaActual(), "I", Convert.ToInt16(Session["empresa"])) == 0)
        {
            ManejoError("Usuario no autorizado para ejecutar esta operaci�n", "C");
            return;
        }

        CcontrolesUsuario.HabilitarControles(
            this.Page.Controls);
        CcontrolesUsuario.LimpiarControles(Page.Controls);

        this.nilbNuevo.Visible = false;
        this.Session["editar"] = false;

        CargarCombos();


        txtCodigo.Text = cargos.Consecutivo(Convert.ToInt16(Session["empresa"]));
        txtCodigo.Enabled = false;
        txtDescripcion.Focus();


        this.nilblInformacion.Text = "";
    }

    protected void lbCancelar_Click(object sender, EventArgs e)
    {
        CcontrolesUsuario.InhabilitarControles(
            this.Page.Controls);

        CcontrolesUsuario.LimpiarControles(
            this.Page.Controls);

        this.gvLista.DataSource = null;
        this.gvLista.DataBind();

        this.nilbNuevo.Visible = true;
        this.nilblInformacion.Text = "";
    }

    protected void txtConcepto_TextChanged(object sender, EventArgs e)
    {
        EntidadKey();
        txtDescripcion.Focus();
    }
    protected void gvLista_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            if (seguridad.VerificaAccesoOperacion(this.Session["usuario"].ToString(),
                                    ConfigurationManager.AppSettings["Modulo"].ToString(),
                                     nombrePaginaActual(), "E", Convert.ToInt16(Session["empresa"])) == 0)
            {
                ManejoError("Usuario no autorizado para ejecutar esta operaci�n", "C");
                return;
            }

            object[] objValores = new object[] {
                Convert.ToString(Server.HtmlDecode(this.gvLista.Rows[e.RowIndex].Cells[2].Text)),
                Convert.ToInt16(Session["empresa"])
            };

            switch (CentidadMetodos.EntidadInsertUpdateDelete(
                "nCargo",
                "elimina",
                "ppa",
                objValores))
            {
                case 0:

                    ManejoExito("Registro eliminado satisfactoriamente", "E");
                    break;

                case 1:

                    ManejoError("Error al eliminar el registro. Operaci�n no realizada", "E");
                    break;
            }
        }
        catch (Exception ex)
        {
            if (ex.HResult.ToString() == "-2146233087")
            {
                ManejoError("El c�digo ('" + Convert.ToString(Server.HtmlDecode(this.gvLista.Rows[e.RowIndex].Cells[2].Text)) +
                "' - ' " + Convert.ToString(Server.HtmlDecode(this.gvLista.Rows[e.RowIndex].Cells[3].Text)) + "') tiene una asociaci�n, no es posible eliminar el registro.", "E");
            }
            else
            {
                ManejoError("Error al eliminar el registro. Correspondiente a: " + ex.Message, "E");
            }
        }
    }

    protected void gvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvLista.PageIndex = e.NewPageIndex;
        GetEntidad();
        gvLista.DataBind();
    }

    protected void lbRegistrar_Click(object sender, ImageClickEventArgs e)
    {

        if (txtCodigo.Text.Trim().ToString().Length == 0 || txtDescripcion.Text.Length == 0)
        {
            nilblMensaje.Text = "Campos vacios por favor corrija";
            return;
        }
        Guardar();
    }

    protected void gvLista_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (seguridad.VerificaAccesoOperacion(
         this.Session["usuario"].ToString(),
         ConfigurationManager.AppSettings["Modulo"].ToString(),
          nombrePaginaActual(),
         "A", Convert.ToInt16(Session["empresa"])) == 0)
        {
            ManejoError("Usuario no autorizado para ejecutar esta operaci�n", "A");
            return;
        }


        CcontrolesUsuario.HabilitarControles(
         this.Page.Controls);

        this.nilbNuevo.Visible = false;
        this.Session["editar"] = true;

        this.txtCodigo.Enabled = false;
        this.txtDescripcion.Focus();
        CargarCombos();
        try
        {
            if (this.gvLista.SelectedRow.Cells[2].Text != "&nbsp;")
            {
                this.txtCodigo.Text = Server.HtmlDecode(this.gvLista.SelectedRow.Cells[2].Text);
            }
            else
            {
                this.txtCodigo.Text = "";
            }

            if (this.gvLista.SelectedRow.Cells[3].Text != "&nbsp;")
            {
                this.txtDescripcion.Text = Server.HtmlDecode(this.gvLista.SelectedRow.Cells[3].Text);
            }
            else
            {
                this.txtDescripcion.Text = "";
            }

            if (this.gvLista.SelectedRow.Cells[4].Text != "&nbsp;")
            {
                this.ddlJefeInmediato.SelectedValue = Server.HtmlDecode(this.gvLista.SelectedRow.Cells[4].Text);
            }

            if (this.gvLista.SelectedRow.Cells[5].Text != "&nbsp;")
            {
                this.txvSalario.Text = Server.HtmlDecode(this.gvLista.SelectedRow.Cells[5].Text);
            }
            else
            {
                this.txvSalario.Text = "0";
            }

            if (this.gvLista.SelectedRow.Cells[6].Text != "&nbsp;")
            {
                this.txtObservacion.Text = Server.HtmlDecode(this.gvLista.SelectedRow.Cells[6].Text);
            }
            else
            {
                this.txtObservacion.Text = "";
            }


            foreach (Control objControl in this.gvLista.SelectedRow.Cells[7].Controls)
            {
                if (objControl is CheckBox)
                {
                    this.chkActivo.Checked = ((CheckBox)objControl).Checked;
                }
            }

        }
        catch (Exception ex)
        {
            ManejoError("Error al cargar los campos correspondiente a: " + ex.Message, "C");
        }
    }

    protected void niimbBuscar_Click(object sender, ImageClickEventArgs e)
    {
        CcontrolesUsuario.InhabilitarControles(
            this.Page.Controls);

        this.nilbNuevo.Visible = true;

        GetEntidad();
    }

    protected void nilblRegresar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Novedad.aspx");
    }
    protected void gvLista_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        gvLista.PageIndex = e.NewPageIndex;
        GetEntidad();
        gvLista.DataBind();
    }

    #endregion Eventos





  
}