<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="GestionComandas.aspx.cs" Inherits="Restaurante.GestionComandas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px;">
        <div class="container-fluid">
            <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link active" href="#paneTwo1" role="tab" id="hatstab1" data-toggle="tab" aria-controls="hats">Datos del Cliente</a></li>
                <li class="nav-item"><a class="nav-link" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Registro de Productos</a> </li>
                <li class="nav-item"><a class="nav-link" href="#paneTwo2" role="tab" id="hatstab2" data-toggle="tab" aria-controls="hats">Datos</a></li>
            </ul>
            <!-- Content Panel -->
            <div id="clothingnavcontent1" class="tab-content">


                <div role="tabpanel" class="tab-pane fade show active" id="paneTwo1" aria-labelledby="hatstab1">
                    <div class="row" style="padding-top: 50px;">

                        <div class="col-lg-4 offset-lg-2">
                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtNombreCliente" ErrorMessage="Debe ingresar el nombre del cliente"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label4" runat="server" Text="Nombre Cliente: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtNombreCliente" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtMesero" ErrorMessage="Debe ingresar el mesero que atiende"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label6" runat="server" Text="Mesero: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtMesero" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label11" runat="server" Text="Mesa: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlMesas" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMesas_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <span class="badge bg-inverse">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <p>
                                                    <b>Descripción: </b>
                                                    <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
                                                </p>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlMesas" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </span>
                            </div>

                        </div>
                    </div>

                </div>


                <div role="tabpanel" class="tab-pane fade " id="home1" aria-labelledby="hometab1">
                    <div class="row" style="padding-top: 50px;">

                        <div class="col-lg-6 offset-lg-2">

                            <div class="row">
                                <div class="col-lg-3 text-right">
                                    <asp:Label ID="Label1" runat="server" Text="Tipo Producto: "></asp:Label>
                                </div>
                                <div class=" col-lg-5 form-group">
                                    <asp:DropDownList ID="ddlTipoProducto" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlTipoProducto_SelectedIndexChanged1" AutoPostBack="true">
                                        <asp:ListItem Value="0">Refresco</asp:ListItem>
                                        <asp:ListItem Value="1">Plato Fuerte</asp:ListItem>
                                        <asp:ListItem Value="2">Postre</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 text-right">
                                    <asp:Label ID="Label12" runat="server" Text="Producto: "></asp:Label>
                                </div>
                                <div class=" col-lg-5 form-group">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlTipoProducto" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Cantidad: "></asp:Label>
                                </div>
                                <div class=" col-lg-2 form-group">
                                    <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" Text="1"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-4 offset-lg-4">
                                    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-secondary btn-lg" />
                                </div>
                            </div>

                            <div class="row">
                                <asp:GridView ID="grvListado" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" DataKeyNames="ID">
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade show active" id="paneTwo2" aria-labelledby="hatstab1">
                    <div class="row" style="padding-top: 50px;">

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
