<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="ReporteMedioPago.aspx.cs" Inherits="Restaurante.ReporteTipoPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px;">
        <div class="container-fluid">
            <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link active" href="#paneTwo1" role="tab" id="hatstab1" data-toggle="tab" aria-controls="hats">Reporte por Medio de Pago</a></li>
            </ul>
            <!-- Content Panel -->
            <div id="clothingnavcontent1" class="tab-content">

                <div role="tabpanel" class="tab-pane fade show active" id="paneTwo1" aria-labelledby="hatstab1">
                    <div class="row" style="padding-top: 50px;">

                        <div class="col-lg-4 offset-lg-2">

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label4" runat="server" Text="Medio de Pago:"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlMedio" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMedio_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">Efectivo</asp:ListItem>
                                        <asp:ListItem Value="1">Electronico</asp:ListItem>
                                    </asp:DropDownList>
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
                                        <asp:GridView ID="grvListado" runat="server" CssClass="table table-bordered table-hover"
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
                                        <asp:AsyncPostBackTrigger ControlID="ddlMedio" EventName="SelectedIndexChanged" />
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
