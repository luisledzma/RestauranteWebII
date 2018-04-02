<%@ Page Title="Gestion de Mesas" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="GestionMesas.aspx.cs" Inherits="Restaurante.GestionMesas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 50px;">
        <div class="row">


            <%=cargarMesas() %>


            <div id="comandaModal" class="modal fade " aria-hidden="true" data-backdrop="static" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Label ID="lblMesa" runat="server">
                            </asp:Label>
                            <asp:HiddenField ID="hfMesas" runat="server" />
                        </div>
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


                                <div class="modal-body">

                                    <div class="row" style="padding-bottom: 10px;">
                                        <div class="col-lg-2 offset-lg-5">
                                            <asp:Button ID="btnCargarComanda" CssClass="btn btn-sm btn-primary" OnClick="btnCargarComanda_Click" runat="server" Text="Ver Comanda" />
                                            <asp:Label ID="lblComanda" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row" id="existeComanda" runat="server" style="display: none;">

                                        <div class="col-lg-5 offset-lg-1">
                                            <asp:Label ID="lblMesero" runat="server" Text="Mesero: "></asp:Label>
                                            <asp:TextBox ID="txtMesero" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-5 ">
                                            <asp:Label ID="lblCliente" runat="server" Text="Cliente: "></asp:Label>
                                            <asp:TextBox ID="txtCliente" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-5 offset-lg-1">
                                            <asp:Label ID="lblNotas" runat="server" Text="Notas: "></asp:Label>
                                            <asp:TextBox ID="txtNotas" runat="server" TextMode="MultiLine" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-5 ">
                                            <asp:Label ID="lblTotal" runat="server" Text="Total: "></asp:Label>
                                            <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-2 offset-lg-1">
                                            <asp:Label ID="lblEstadoActual" runat="server" Text="Estado Actual: "></asp:Label>
                                            <asp:TextBox ID="txtEstadoActual" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3" id="idEstado" runat="server" style="display: none;">
                                            <asp:Label ID="Label1" runat="server" Text="Actualizar a Estado : "></asp:Label>
                                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>

                                        <div class="col-lg-3 " id="pagar" runat="server" style="display: none; padding-top: 30px;">
                                            <asp:Button ID="btnPagar" CssClass="btn btn-sm btn-primary" runat="server" Text="Realizar Pago" OnClick="btnPagar_Click" />
                                        </div>

                                        <div class="col-lg-7 offset-lg-1" style="padding-top: 20px;">
                                            <asp:GridView ID="grvProductos" runat="server" CssClass="table table-bordered table-hover"
                                                AutoGenerateColumns="false"
                                                DataKeyNames="NOMBREPRODUCTO,CANTIDAD,SUBTOTAL">
                                                <Columns>
                                                    <asp:BoundField DataField="NOMBREPRODUCTO" HeaderText="Producto" ReadOnly="true"></asp:BoundField>
                                                    <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad" ReadOnly="true"></asp:BoundField>
                                                    <asp:BoundField DataField="SUBTOTAL" HeaderText="Subtotal" ReadOnly="true"></asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                    </div>
                                    <div class="row offset-3" id="msjAlert" runat="server" style="display: none;">
                                        <div class="alert alert-primary" role="alert">
                                            Esta mesa no tiene ninguna comanda asociada.
                                        </div>
                                    </div>

                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnGuardar" CssClass="btn btn-primary" Visible="false" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCerrar" CssClass="btn btn-primary" runat="server" Text="Cerrar" OnClick="btnCerrar_Click" />
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>

                </div>
            </div>







        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">

    <script>

        function verComanda(obj) {
            var mesa = $(obj).data("mesa");
            document.getElementById("<%=hfMesas.ClientID%>").value = mesa;
            $('#<%=lblMesa.ClientID%>').html(mesa);
            $('#comandaModal').modal();

        }

    </script>
</asp:Content>
