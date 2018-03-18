<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="MantenimientoUsuarios.aspx.cs" Inherits="Restaurante.MantenimientoUsuarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="col-lg-5">
        <h2>Registro de Meseros</h2>
        <div class="form-group row">

            <asp:Label ID="Label1" runat="server" Text="Identificación"></asp:Label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtId" ErrorMessage="Debe ingresar la Identificación"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtNombre" ErrorMessage="Debe ingresar el Nombre"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label5" runat="server" Text="Apellido"></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtApellido" ErrorMessage="Debe ingresar el Apellido"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label7" runat="server" Text="Teléfono"></asp:Label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtTelefono" ErrorMessage="Debe ingresar el Teléfono"></asp:RequiredFieldValidator>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="9999-9999" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" BehaviorID="txtTelefono_MaskedEditExtender" TargetControlID="txtTelefono" />

        </div>

        <div class="form-group row">

            <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtEmail" ErrorMessage="Debe ingresar el Email"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label9" runat="server" Text="Contraseña"></asp:Label>
            <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtContra" ErrorMessage="Debe ingresar la Contraseña"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label10" runat="server" Text="Estado"></asp:Label>
            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                <asp:ListItem Value="0">Inactivo</asp:ListItem>
                <asp:ListItem Value="1">Activo</asp:ListItem>
            </asp:DropDownList>

        </div>

        <div class="form-group row">

            <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" ValidationGroup="FormRegistro" Text="Registrar" CssClass="btn btn-success btn-lg" />


        </div>

    </div>
    
    <div class="col-lg-6 offset-lg-1">
        <h2>Listado de Meseros</h2>
        <div class="form-group row">
            <asp:GridView ID="grvListado" runat="server" CssClass="table table-hover"
                AutoGenerateColumns="false"
                DataKeyNames="IDENTIFICACION"
                AutoGenerateEditButton="true"
                OnRowEditing="grvListado_RowEditing"
                OnRowCancelingEdit="grvListado_RowCancelingEdit"
                OnRowDataBound="grvListado_RowDataBound"
                OnRowUpdating="grvListado_RowUpdating">

                <Columns>
                    <asp:BoundField DataField="IDENTIFICACION" HeaderText="Identificaci&#243;n" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="APELLIDOS" HeaderText="Apellidos" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="TELEFONO" HeaderText="Tel&#233;fono" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="CORREO_ELECTRONICO" HeaderText="Correo Electronio" ReadOnly="True"></asp:BoundField>

                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEstadoEdit" runat="server">
                                <asp:ListItem Value="0">Inactivo</asp:ListItem> 
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("ESTADO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
