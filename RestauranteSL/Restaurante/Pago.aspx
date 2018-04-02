<%@ Page Title="Pago" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="Pago.aspx.cs" Inherits="Restaurante.Pago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 30px;">
        <div class="row">

            <div class="col-lg-2" style="padding-top: 100px;">
                <div class="form-group">
                    <label>Subtotal:</label>
                    <asp:TextBox ID="txtSubtotal" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Impuesto de Ventas:</label>
                    <asp:TextBox ID="txtIV" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Servicio:</label>
                    <asp:TextBox ID="txtServicio" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Total:</label>
                    <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>
            </div>


            <div class="col-lg-6 offset-lg-1">
                <div class="container-fluid">
                    <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
                        <li class="nav-item"><a class="nav-link active" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Pago electrónico</a> </li>
                        <li class="nav-item"><a class="nav-link" href="#paneTwo1" role="tab" id="hatstab1" data-toggle="tab" aria-controls="hats">Pago en efectivo</a> </li>
                    </ul>
                    <div id="clothingnavcontent1" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade show active" id="home1" aria-labelledby="hometab1">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>

                                    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgresUpdatePanel1" runat="server" DynamicLayout="true">
                                        <ProgressTemplate>
                                            <div class="loading-panel">
                                                <div class="loading-container">
                                                    <img class="mx-auto d-block" src="Assets/img/loading.svg" style="width: 150px; height: 150px; display: block; position: absolute; z-index: 2001; left: 40%; top: 45%;" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>

                                    <div class="row" style="padding-top: 20px;">
                                        <div class="col-lg-10 offset-lg-1">
                                            <div class="card card-outline-secondary">
                                                <div class="card-body">
                                                    <h3 class="text-center">Pago Electrónico</h3>
                                                    <div class="form-group">
                                                        <label for="cc_name">Tipo de Tarjeta</label>
                                                        <asp:DropDownList ID="ddlTarjeta" ValidationGroup="pagoElectronico" runat="server" CssClass="form-control rounded-input" Style="font-size: 16px; font-family: Arial;">
                                                            <asp:ListItem Value="MasterCard" Text="MasterCard"></asp:ListItem>
                                                            <asp:ListItem Value="VISA" Text="VISA"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Numero de Tarjeta</label>
                                                        <asp:TextBox ID="txtNumTarjeta" runat="server" ValidationGroup="pagoElectronico" CssClass="form-control" placeholder="0000-0000-0000-0000"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-lg-12">Fecha de Expiración</label>
                                                        <div class="col-lg-6">
                                                            <asp:DropDownList ID="ddlMesVencimiento" ValidationGroup="pagoElectronico" runat="server" CssClass="form-control rounded-input" Style="font-size: 16px; font-family: Arial;">
                                                                <asp:ListItem Value="01" Text="Enero"></asp:ListItem>
                                                                <asp:ListItem Value="02" Text="Febrero"></asp:ListItem>
                                                                <asp:ListItem Value="03" Text="Marzo"></asp:ListItem>
                                                                <asp:ListItem Value="04" Text="Abril"></asp:ListItem>
                                                                <asp:ListItem Value="05" Text="Mayo"></asp:ListItem>
                                                                <asp:ListItem Value="06" Text="Junio"></asp:ListItem>
                                                                <asp:ListItem Value="07" Text="Julio"></asp:ListItem>
                                                                <asp:ListItem Value="08" Text="Agosto"></asp:ListItem>
                                                                <asp:ListItem Value="09" Text="Setiembre"></asp:ListItem>
                                                                <asp:ListItem Value="10" Text="Octubre"></asp:ListItem>
                                                                <asp:ListItem Value="11" Text="Noviembre"></asp:ListItem>
                                                                <asp:ListItem Value="12" Text="Diciembre"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <asp:DropDownList ID="ddlAnnoVencimiento" ValidationGroup="pagoElectronico" runat="server" CssClass="form-control rounded-input" Style="font-size: 16px; font-family: Arial;">
                                                                <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                                                <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                                                                <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                                                                <asp:ListItem Value="2021" Text="2021"></asp:ListItem>
                                                                <asp:ListItem Value="2022" Text="2022"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtCVC" ValidationGroup="pagoElectronico" CssClass="form-control col-lg-4" runat="server" placeholder="CVC"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group row">
                                                        <div class="col-lg-4 offset-lg-2">
                                                            <asp:Button ID="btnCancelarEl" CssClass="btn btn-primary" runat="server" Text="Cancelar" OnClick="btnCancelarEl_Click" />
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:Button ID="btnAceptarEl" ValidationGroup="pagoElectronico" CssClass="btn btn-primary" runat="server" Text="Aceptar" OnClick="btnAceptarEl_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="paneTwo1" aria-labelledby="hatstab1">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
                                    <div class="row" style="padding-top: 20px;">
                                        <div class="col-lg-10 offset-lg-1">
                                            <div class="card card-outline-secondary">
                                                <div class="card-body">
                                                    <h3 class="text-center">Pago en efectivo</h3>

                                                    <div class="form-group">
                                                        <label for="cc_name">Paga con: </label>
                                                        <asp:TextBox ID="txtPagaCon" ValidationGroup="pagoEfectivo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Vuelto</label>
                                                        <asp:TextBox ID="txtVuelto" ValidationGroup="pagoEfectivo" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group row">
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-lg-4 offset-lg-2">
                                                            <asp:Button ID="btnCancelarEf" OnClick="btnCancelarEf_Click" CssClass="btn btn-primary" runat="server" Text="Cancelar" />
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:Button ID="btnAceptarEf" OnClick="btnAceptarEf_Click" ValidationGroup="pagoEfectivo" CssClass="btn btn-primary" runat="server" Text="Aceptar" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="modal" id="idErrorPago" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Error</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="alert alert-danger" role="alert">
                                <asp:Label ID="lblMsjError" runat="server" Text=""></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPagoExitoso" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="tituloPago" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tituloPago">Pago exitoso</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Pago Exitoso!</h4>
                        <p>Su pago se ha realizado correctamente</p>
                        <hr />
                        <p class="mb-0">Descargar comprobante.</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-secondary" href="GestionMesas.aspx">Close</a>
                </div>
            </div>
        </div>
    </div>





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">

    <script>

    </script>

</asp:Content>
