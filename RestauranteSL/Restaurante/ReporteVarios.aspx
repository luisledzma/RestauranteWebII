<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="ReporteVarios.aspx.cs" Inherits="Restaurante.ReporteVarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px;">
        <div class="container-fluid">
            <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link active" href="#paneTwo1" role="tab" id="hatstab1" data-toggle="tab" aria-controls="hats">Reporte por Mesa</a></li>
                <li class="nav-item"><a class="nav-link" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Reporte por Mesero</a> </li>
                <li class="nav-item"><a class="nav-link" href="#home2" id="hometab2" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Reporte por Producto</a> </li>
            </ul>
            <!-- Content Panel -->
            <div id="clothingnavcontent1" class="tab-content">


                <div role="tabpanel" class="tab-pane fade show active" id="paneTwo1" aria-labelledby="hatstab1">
                    <div class="row" style="padding-top: 50px;">

                        <div class="col-lg-4 offset-lg-2">

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label4" runat="server" Text="Mesas:"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlMesas" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMesas_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-11 offset-lg-1">
                            <div class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server" DynamicLayout="true">
                                            <ProgressTemplate>
                                                <div class="loading-panel">
                                                    <div class="loading-container">
                                                        <img class="mx-auto d-block" src="Assets/img/loading.svg" style="width: 150px; height: 150px; display: block; position: absolute; z-index: 2001; left: 40%; top: 45%;" />
                                                    </div>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:GridView ID="grvListaMesas" runat="server" CssClass="table table-bordered table-hover"
                                            AutoGenerateColumns="false" DataKeyNames="ID">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID"></asp:BoundField>
                                                <asp:BoundField DataField="IDMESERO" HeaderText="IDMesero"></asp:BoundField>
                                                <asp:BoundField DataField="IDMESA" HeaderText="IDMesa"></asp:BoundField>
                                                <asp:BoundField DataField="IDCOMANDA" HeaderText="IDComanda"></asp:BoundField>
                                                <asp:BoundField DataField="FECHA" HeaderText="Fecha"></asp:BoundField>
                                                <asp:BoundField DataField="CLIENTE" HeaderText="Cliente"></asp:BoundField>
                                                <asp:BoundField DataField="TIPOPAGO" HeaderText="TipoPago"></asp:BoundField>
                                                <asp:BoundField DataField="TOTAL" HeaderText="Total"></asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlMesas" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                </div>


                <div role="tabpanel" class="tab-pane fade " id="home1" aria-labelledby="hometab1">
                    <div class="row" style="padding-top: 50px;">
                        <div class="col-lg-4 offset-lg-2">

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label1" runat="server" Text="Meseros:"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlMeseros" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMeseros_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-11 offset-lg-1">
                            <div class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress2" runat="server" DynamicLayout="true">
                                            <ProgressTemplate>
                                                <div class="loading-panel">
                                                    <div class="loading-container">
                                                        <img class="mx-auto d-block" src="Assets/img/loading.svg" style="width: 150px; height: 150px; display: block; position: absolute; z-index: 2001; left: 40%; top: 45%;" />
                                                    </div>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:GridView ID="grvListaMeseros" runat="server" CssClass="table table-bordered table-hover"
                                            AutoGenerateColumns="false" DataKeyNames="ID">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID"></asp:BoundField>
                                                <asp:BoundField DataField="IDMESERO" HeaderText="IDMesero"></asp:BoundField>
                                                <asp:BoundField DataField="IDMESA" HeaderText="IDMesa"></asp:BoundField>
                                                <asp:BoundField DataField="IDCOMANDA" HeaderText="IDComanda"></asp:BoundField>
                                                <asp:BoundField DataField="FECHA" HeaderText="Fecha"></asp:BoundField>
                                                <asp:BoundField DataField="CLIENTE" HeaderText="Cliente"></asp:BoundField>
                                                <asp:BoundField DataField="TIPOPAGO" HeaderText="TipoPago"></asp:BoundField>
                                                <asp:BoundField DataField="TOTAL" HeaderText="Total"></asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlMeseros" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>


                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade " id="home2" aria-labelledby="hometab1">
                    <div class="row" style="padding-top: 50px;">
                        <div class="col-lg-4 offset-lg-2">
                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Tipo de Producto"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProducto_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">Refresco</asp:ListItem>
                                        <asp:ListItem Value="1">Plato Fuerte</asp:ListItem>
                                        <asp:ListItem Value="2">Postre</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        
                        <div class="col-lg-11 offset-lg-1">
                            <div class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress3" runat="server" DynamicLayout="true">
                                            <ProgressTemplate>
                                                <div class="loading-panel">
                                                    <div class="loading-container">
                                                        <img class="mx-auto d-block" src="Assets/img/loading.svg" style="width: 150px; height: 150px; display: block; position: absolute; z-index: 2001; left: 40%; top: 45%;" />
                                                    </div>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:GridView ID="grvListaProduct" runat="server" CssClass="table table-bordered table-hover"
                                            AutoGenerateColumns="false" DataKeyNames="IDFACTURA">

                                            <Columns>
                                                <asp:BoundField DataField="IDFACTURA" HeaderText="ID Factura"></asp:BoundField>
                                                <asp:BoundField DataField="IDPRODUCTO" HeaderText="ID Producto"></asp:BoundField>
                                                <asp:BoundField DataField="NOMBREPRODUCTO" HeaderText="Nombre"></asp:BoundField>
                                                <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad"></asp:BoundField>
                                                <asp:BoundField DataField="IMPUESTOVENTAS" HeaderText="Impuesto Ventas"></asp:BoundField>
                                                <asp:BoundField DataField="SERVICIO" HeaderText="Impuesto Servicios"></asp:BoundField>
                                                <asp:BoundField DataField="SUBTOTAL" HeaderText="Subtotal"></asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlProducto" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
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
