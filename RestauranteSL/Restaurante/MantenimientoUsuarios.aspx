<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="MantenimientoUsuarios.aspx.cs" Inherits="Restaurante.MantenimientoUsuarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px;">
        <div class="container-fluid">
            <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link active" href="#paneTwo1" role="tab" id="hatstab1" data-toggle="tab" aria-controls="hats">Listado de Usuarios</a></li>
                <li class="nav-item"><a class="nav-link" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Registro de Usuarios</a> </li>
            </ul>
            <!-- Content Panel -->
            <div id="clothingnavcontent1" class="tab-content">


                <div role="tabpanel" class="tab-pane fade show active" id="paneTwo1" aria-labelledby="hatstab1">
                    <div class="row" style="padding-top: 50px;">


                        <div class="col-lg-11 offset-lg-1">
                            <div class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grvListado" runat="server" CssClass="table table-bordered table-hover"
                                            AutoGenerateColumns="false"
                                            DataKeyNames="IDENTIFICACION"
                                            AutoGenerateEditButton="false"
                                            OnRowEditing="grvListado_RowEditing"
                                            OnRowCancelingEdit="grvListado_RowCancelingEdit"
                                            OnRowDataBound="grvListado_RowDataBound"
                                            OnRowUpdating="grvListado_RowUpdating"
                                            GridLines="None">

                                            <Columns>
                                                <asp:BoundField DataField="IDENTIFICACION" HeaderText="Identificaci&#243;n" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="APELLIDOS" HeaderText="Apellidos" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="TELEFONO" HeaderText="Tel&#233;fono" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="CORREO_ELECTRONICO" HeaderText="Correo Electronico" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="FK_PERFIL" HeaderText="Perfil" ReadOnly="True"></asp:BoundField>

                                                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList CssClass="form-control" ID="ddlEstadoEdit" runat="server">
                                                            <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                                            <asp:ListItem Value="1">Activo</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("ESTADO") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:CommandField ShowEditButton="true" EditText="Editar" ControlStyle-CssClass="btn btn-secondary" />

                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>


                <div role="tabpanel" class="tab-pane fade " id="home1" aria-labelledby="hometab1">
                    <div class="row" style="padding-top: 50px;">
                        <div class="col-lg-4 offset-lg-2">

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtId" ErrorMessage="Debe ingresar la Identificación"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label1" runat="server" Text="Identificación: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtNombre" ErrorMessage="Debe ingresar el Nombre"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtApellido" ErrorMessage="Debe ingresar el Apellido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label5" runat="server" Text="Apellido: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtTelefono" ErrorMessage="Debe ingresar el Teléfono"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="9999-9999" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" BehaviorID="txtTelefono_MaskedEditExtender" TargetControlID="txtTelefono" />
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label7" runat="server" Text="Teléfono: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtEmail" ErrorMessage="Debe ingresar el Email"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label8" runat="server" Text="Email: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtContra" ErrorMessage="Debe ingresar la Contraseña"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label9" runat="server" Text="Contraseña: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label3" runat="server" Text="Perfil: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1">Gerente</asp:ListItem>
                                        <asp:ListItem Value="0">Mesero</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label10" runat="server" Text="Estado: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                        <asp:ListItem Value="1">Activo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="row">
                                <div class="form-group col-lg-4 offset-lg-4">
                                    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-secondary btn-lg" />
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
