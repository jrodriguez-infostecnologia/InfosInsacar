<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Finca.aspx.cs" Inherits="Agronomico_Padministracion_Finca"  %>
<%@ OutputCache Location="None" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
 
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seguridad</title>
    
    <%-- Este es el estilo de combobox --%>

    <link href="../../css/chosen.css" rel="stylesheet" />
  
    <link href="../../css/Formularios.css" rel="stylesheet" />
    <script src="../../js/Numero.js" type="text/javascript"></script>
    

</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <div class="principal">
            <table cellspacing="0" style="width: 1000px">
                <tr>
                    <td class="bordes">
                        </td>
                    <td class="nombreCampos">Busqueda</td>
                    <td class="Campos">
                    <asp:TextBox ID="nitxtBusqueda" runat="server" Width="300px" ToolTip="Escriba el texto para la busqueda" CssClass="input"></asp:TextBox></td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td colspan="4">
                    <asp:ImageButton ID="niimbBuscar" runat="server" ImageUrl="~/Imagen/Bonotes/btnBuscar.jpg" ToolTip="Haga clic aqui para realizar la busqueda" OnClick="niimbBuscar_Click" 
                        onmouseout="this.src='../../Imagen/Bonotes/btnBuscar.jpg'" 
                        onmouseover="this.src='../../Imagen/Bonotes/btnBuscarN.jpg'"
                         />
                        <asp:ImageButton ID="nilbNuevo" runat="server" ImageUrl="~/Imagen/Bonotes/btnNuevo.jpg" ToolTip="Habilita el formulario para un nuevo registro" OnClick="lbNuevo_Click"
                            onmouseout="this.src='../../Imagen/Bonotes/btnNuevo.jpg'"
                            onmouseover="this.src='../../Imagen/Bonotes/btnNuevN.jpg'" />
                        <asp:ImageButton ID="lbCancelar" runat="server" ImageUrl="~/Imagen/Bonotes/btnCancelar.jpg" ToolTip="Cancela la operaci�n" OnClick="lbCancelar_Click"
                            onmouseout="this.src='../../Imagen/Bonotes/btnCancelar.jpg'"
                            onmouseover="this.src='../../Imagen/Bonotes/btnCancelarNegro.jpg'" Visible="False" />

                        <asp:ImageButton ID="lbRegistrar" runat="server" ImageUrl="~/Imagen/Bonotes/btnGuardar.jpg" ToolTip="Guarda el nuevo registro en la base de datos"
                            onmouseout="this.src='../../Imagen/Bonotes/btnGuardar.jpg'"
                            onmouseover="this.src='../../Imagen/Bonotes/btnGuardarN.jpg'" OnClick="lbRegistrar_Click" Visible="False" OnClientClick="if(!confirm('Desea insertar el registro ?')){return false;};" />
                    </td>
                </tr>
            </table>
            <table cellspacing="0" style="width: 1000px; border-top: silver thin solid; border-bottom: silver thin solid;" id="TABLE1" >
                <tr>
                    <td colspan="4">
                        <asp:Label ID="nilblInformacion" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label2" runat="server" Text="C�digo" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:TextBox ID="txtCodigo" runat="server" Visible="False" Width="200px" AutoPostBack="True" OnTextChanged="txtConcepto_TextChanged" CssClass="input" MaxLength="50"></asp:TextBox></td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td class="bordes">&nbsp;</td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label8" runat="server" Text="C�digo equivalencia" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:TextBox ID="txtCodigoEquivalencia" runat="server" Visible="False" Width="200px" CssClass="input" MaxLength="50"></asp:TextBox></td>
                    <td class="bordes">&nbsp;</td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label3" runat="server" Text="Descripci�n" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:TextBox ID="txtDescripcion" runat="server" Visible="False" Width="350px" CssClass="input"></asp:TextBox></td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label4" runat="server" Text="Propietario" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:DropDownList data-placeholder="Seleccione una opci�n..."  CssClass="chzn-select" ID="ddlProveedor" runat="server"  Width="350px" Visible="False">
                        </asp:DropDownList>
                    </td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label6" runat="server" Text="N�mero de (ha)" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:TextBox ID="txtNoHectarea" runat="server" Visible="False" Width="150px" CssClass="input" ValidateRequestMode="Enabled" ViewStateMode="Enabled" onkeyup="formato_numero(this)" MaxLength="15"></asp:TextBox></td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label5" runat="server" Text="Ciudad" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:DropDownList data-placeholder="Seleccione una opci�n..."  CssClass="chzn-select" ID="ddlCiudad" runat="server"  Width="350px" Visible="False">
                        </asp:DropDownList>
                    </td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        <asp:Label ID="Label7" runat="server" Text="Zona geogr�fica" Visible="False"></asp:Label>
                    </td>
                    <td class="Campos">
                        <asp:TextBox ID="txtZonaGeografica" runat="server" Visible="False" Width="350px" CssClass="input"></asp:TextBox></td>
                    <td class="bordes"></td>
                </tr>
                <tr>
                    <td class="bordes"></td>
                    <td class="nombreCampos">
                        </td>
                    <td class="Campos">
                        <asp:CheckBox ID="chkInterno" runat="server" Text="Interna" Visible="False" />
                        <asp:CheckBox ID="chkActivo" runat="server" Text="Activo" Visible="False" />
                    </td>
                    <td class="bordes"></td>
                </tr>
                </table>
            <div class="tablaGrilla">
                <asp:GridView ID="gvLista" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="Grid" OnRowDeleting="gvLista_RowDeleting" PageSize="20" Width="800px" OnPageIndexChanging="gvLista_PageIndexChanging" OnSelectedIndexChanged="gvLista_SelectedIndexChanged1">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:ButtonField ButtonType="Image" HeaderText="Edit" ImageUrl="~/Imagen/TabsIcon/pencil.png" Text="Bot�n" CommandName="Select">
                        <ItemStyle Width="20px" CssClass="Items" />
                        </asp:ButtonField>
                        <asp:TemplateField HeaderText="Elim">
                            <ItemTemplate>
                                <asp:ImageButton ID="imElimina" runat="server" CommandName="Delete" ImageUrl="~/Imagen/TabsIcon/cancel.png" OnClientClick="if(!confirm('Desea eliminar el registro ?')){return false;};" ToolTip="Elimina el registro seleccionado" />
                            </ItemTemplate>
                            <HeaderStyle BackColor="White" />
                            <ItemStyle Width="20px" CssClass="Items" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="codigo" HeaderText="C�digo" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="Descripci�n" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="proveedor" HeaderText="Proveedor" >
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="hectareas" HeaderText="NoHect" >
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ciudad" HeaderText="Ciudad" >
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zonaGeografica" HeaderText="ZonaGeogr�fica" >
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                         <asp:CheckBoxField DataField="interna" HeaderText="Int">
                            <ItemStyle HorizontalAlign="Center" Width="40px" CssClass="Items" />
                        </asp:CheckBoxField>
                        <asp:CheckBoxField DataField="activo" HeaderText="Act">
                            <ItemStyle HorizontalAlign="Center" Width="40px" CssClass="Items" />
                        </asp:CheckBoxField>
                           <asp:BoundField DataField="codigoEquivalencia" HeaderText="C�digoEq" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Width="70px" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                    <RowStyle CssClass="rw" />
                </asp:GridView>
            </div>
        </div>

        <script src="../../js/jquery.min.js" type="text/javascript"></script>
        <script src="../../js/chosen.jquery.js" type="text/javascript"></script>
        <script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
    </form>
</body>
</html>
