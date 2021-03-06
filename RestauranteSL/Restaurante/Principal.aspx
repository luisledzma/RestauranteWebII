﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Restaurante.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top: 50px;">
        <div class="container-fluid">

            <div class="row">

                <div style="display: none;" runat="server" id="mantenim1" class="card col-md-3 col-lg-3 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/mesero.png" />
                    <div class="card-body">
                        <h5 class="card-title">Mantenimiento de Usuarios</h5>
                        <p class="card-text">Registra o modifica usuarios en el sistema.</p>
                        <a href="MantenimientoUsuarios.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>
                <div style="display: none;" runat="server" id="mantenim2" class="card col-md-3 col-lg-3 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/mesa.png" />
                    <div class="card-body">
                        <h5 class="card-title">Mantenimiento de Mesas</h5>
                        <p class="card-text">Registra o modifica las características principales de las mesas.</p>
                        <a href="MantenimientoMesas.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>
                <div style="display: none;" runat="server" id="mantenim3" class="card col-md-3 col-lg-3 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/food.png" />
                    <div class="card-body">
                        <h5 class="card-title">Mantenimiento de Productos</h5>
                        <p class="card-text">Brinda mantenimiento a los productos del sistema.</p>
                        <a href="MantenimientoProductos.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>

                <div class="card col-md-3 col-lg-3 wow fadeIn" style="display: none;" runat="server" id="vent1" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/reporte.png" />
                    <div class="card-body">
                        <h5 class="card-title">Reporte por Fecha</h5>
                        <p class="card-text">Muestra el reporte de las ventas por rango de fechas.</p>
                        <a href="ReporteFecha.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>
                <div class="card col-md-3 col-lg-3 wow fadeIn" style="display: none;" runat="server" id="vent2" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/reporte.png" />
                    <div class="card-body">
                        <h5 class="card-title">Reporte por Medio de Pago</h5>
                        <p class="card-text">Muestra el reporte de ventas por medio de pago.</p>
                        <a href="ReporteMedioPago.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>
                <div class="card col-md-3 col-lg-3 wow fadeIn" style="display: none;" runat="server" id="vent3" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/reporte.png" />
                    <div class="card-body">
                        <h5 class="card-title">Reporte por Mesa-Mesero-Producto</h5>
                        <p class="card-text">Muestra el reporte de ventas por mesa, mesero o producto.</p>
                        <a href="ReporteVarios.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>

                <div style="display: none;" runat="server" id="comand" class="card col-md-3 col-lg-3 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/factura.png" />
                    <div class="card-body">
                        <h5 class="card-title">Gestión de Comandas</h5>
                        <p class="card-text">Muestra la ventana para la gestión de las comandas.</p>
                        <a href="GestionComandas.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>

                <div style="display: none;" runat="server" id="comand2" class="card col-md-3 col-lg-3 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <img class="card-img-top" src="Assets/img/factura.png" />
                    <div class="card-body">
                        <h5 class="card-title">Gestión de Mesas</h5>
                        <p class="card-text">Muestra la ventana para la gestión de las mesas.</p>
                        <a href="GestionMesas.aspx" class="btn btn-primary">Presione Aquí</a>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Restaurante</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
