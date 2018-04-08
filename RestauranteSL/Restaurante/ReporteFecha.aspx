<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="ReporteFecha.aspx.cs" Inherits="Restaurante.ReporteFecha" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px;">
        <div class="container-fluid">
            <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link active" href="#paneTwo1" role="tab" id="hatstab1" data-toggle="tab" aria-controls="hats">Reporte por Fechas</a></li>
            </ul>
            <!-- Content Panel -->
            <div id="clothingnavcontent1" class="tab-content">

                <div role="tabpanel" class="tab-pane fade show active" id="paneTwo1" aria-labelledby="hatstab1">
                    <div class="row" style="padding-top: 50px;">

                        <div class="col-lg-4 offset-lg-2">

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label1" runat="server" Text="Fecha Inicial: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaInicial" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender runat="server"
                                        BehaviorID="txtFechaInicial_CalendarExtender" TargetControlID="txtFechaInicial" ID="txtFechaInicial_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormBuscar" ControlToValidate="txtFechaInicial" ErrorMessage="Debe ingresar la fecha inicial"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Fecha Final: "></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtFechaFinal" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender runat="server"
                                        BehaviorID="txtFechaFinal_CalendarExtender" TargetControlID="txtFechaFinal" ID="txtFechaFinal_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="FormBuscar" ControlToValidate="txtFechaFinal" ErrorMessage="Debe ingresar la fecha final"></asp:RequiredFieldValidator>

                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group col-lg-4 offset-lg-4">
                                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="FormBuscar" CssClass="btn btn-secondary btn-lg" />
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-11 offset-lg-1">
                            <div class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
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
