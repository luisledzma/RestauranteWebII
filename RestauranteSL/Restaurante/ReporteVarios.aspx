<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="ReporteVarios.aspx.cs" Inherits="Restaurante.ReporteVarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                                    <asp:Label ID="Label3" runat="server" Text="Fecha Inicial: "></asp:Label>
                                </div>
                                <div class="col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaInicialM" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender TargetControlID="txtFechaInicialM" Format="dd/MM/yyyy" ID="CalendarExtender2" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormBuscar" ControlToValidate="txtFechaInicialM" ErrorMessage="Debe ingresar la fecha inicial"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label5" runat="server" Text="Fecha Final: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaFinalM" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender TargetControlID="txtFechaFinalM" Format="dd/MM/yyyy" ID="CalendarExtender1" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="FormBuscar" ControlToValidate="txtFechaFinalM" ErrorMessage="Debe ingresar la fecha final"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label4" runat="server" Text="Mesas:"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlMesas" runat="server" CssClass="form-control"></asp:DropDownList>
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
                                        <div class="row">
                                            <div class="form-group col-lg-4 offset-lg-4">
                                                <asp:Button ID="btnBuscarM" OnClick="btnBuscarM_Click" runat="server" Text="Buscar" ValidationGroup="FormBuscarM" CssClass="btn btn-secondary btn-lg" />
                                            </div>
                                        </div>

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
                                    <asp:Label ID="Label6" runat="server" Text="Fecha Inicial: "></asp:Label>
                                </div>
                                <div class="col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaInicialMr" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender3" TargetControlID="txtFechaInicialMr" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ValidationGroup="FormBuscar2" ControlToValidate="txtFechaInicialMr" ErrorMessage="Debe ingresar la fecha inicial"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label7" runat="server" Text="Fecha Final: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaFinalMr" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="dd/MM/yyyy" TargetControlID="txtFechaFinalMr" ID="CalendarExtender4" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ValidationGroup="FormBuscar2" ControlToValidate="txtFechaFinalMr" ErrorMessage="Debe ingresar la fecha final"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label1" runat="server" Text="Meseros:"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlMeseros" runat="server" CssClass="form-control" ></asp:DropDownList>
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
                                        <div class="row">
                                            <div class="form-group col-lg-4 offset-lg-4">
                                                <asp:Button ID="btnBuscarMr" OnClick="btnBuscarMr_Click" runat="server" Text="Buscar" ValidationGroup="FormBuscar2" CssClass="btn btn-secondary btn-lg" />
                                            </div>
                                        </div>

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
                                    <asp:Label ID="Label8" runat="server" Text="Fecha Inicial: "></asp:Label>
                                </div>
                                <div class="col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaInicialP" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender5" TargetControlID="txtFechaInicialP" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ValidationGroup="FormBuscarP" ControlToValidate="txtFechaInicialP" ErrorMessage="Debe ingresar la fecha inicial"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label9" runat="server" Text="Fecha Final: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaFinalP" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="dd/MM/yyyy" TargetControlID="txtFechaFinalP" ID="CalendarExtender6" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ValidationGroup="FormBuscar" ControlToValidate="txtFechaFinalP" ErrorMessage="Debe ingresar la fecha final"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Producto"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-control" >
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
                                        <div class="row">
                                            <div class="form-group col-lg-4 offset-lg-4">
                                                <asp:Button ID="btnBuscarP" OnClick="btnBuscarP_Click" runat="server" Text="Buscar" ValidationGroup="FormBuscarP" CssClass="btn btn-secondary btn-lg" />
                                            </div>
                                        </div>
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
