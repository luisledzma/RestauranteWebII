<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="MantenimientoMesas.aspx.cs" Inherits="Restaurante.MantenimientoMesas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="col-lg-5">
        <h2>Registro de Mesas</h2>
        <div class="form-group row">

            <asp:Label ID="lblId" runat="server" Text="Identificación"></asp:Label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtId" ErrorMessage="Debe ingresar la Identificación de la mesa"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label2" runat="server" Text="Descripción"></asp:Label>
            <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtDesc" ErrorMessage="Debe ingresar la Descripción de la mesa"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label10" runat="server" Text="Estado"></asp:Label>
            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                <asp:ListItem Value="0">Inactiva</asp:ListItem>
                <asp:ListItem Value="1">Activa</asp:ListItem>
            </asp:DropDownList>

        </div>

        <div class="form-group row">

            <asp:Label ID="Label7" runat="server" Text="Condición"></asp:Label>
            <asp:TextBox ID="txtCond" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtCond" ErrorMessage="Debe ingresar la Condición de la mesa"></asp:RequiredFieldValidator>
            

        </div>

        <div class="form-group row">
            <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-success btn-lg" />

        </div>
    </div>

    <div class="col-lg-6 offset-lg-1">
        <h2>Listado de Mesas</h2>
        <div class="form-group row">
            <asp:GridView ID="grvListado" runat="server" CssClass="table table-hover"
                AutoGenerateColumns="false"
                DataKeyNames="ID"
                AutoGenerateEditButton="true"
                OnRowEditing="grvListado_RowEditing"
                OnRowCancelingEdit="grvListado_RowCancelingEdit"
                OnRowDataBound="grvListado_RowDataBound"
                OnRowUpdating="grvListado_RowUpdating">


                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Identificaci&#243;n" ReadOnly="True"></asp:BoundField>
                    <asp:TemplateField HeaderText="Descripci&#243;n">
                        <ItemTemplate>
                            <asp:Label ID="lblDescEdit" runat="server" Text='<%# Eval("DESCRIPCION") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescEdit" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ForeColor="Red" ControlToValidate="txtDescEdit" ErrorMessage="La Descripción es requerida"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEstadoEdit" runat="server">
                                <asp:ListItem Value="0">Inactiva</asp:ListItem> 
                                <asp:ListItem Value="1">Activa</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEstadoEdit" runat="server" Text='<%# Eval("ESTADO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Condici&#243;n">
                        <ItemTemplate>
                            <asp:Label ID="lblCondEdit" runat="server" Text='<%# Eval("CONDICION") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCondEdit" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ForeColor="Red" ControlToValidate="txtCondEdit" ErrorMessage="La Condición es requerida"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
