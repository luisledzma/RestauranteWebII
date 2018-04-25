<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="GestionComandas.aspx.cs" Inherits="Restaurante.GestionComandas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/SmartWizard/dist/css/smart_wizard_theme_arrows.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 50px;">
        <div class="row">
            <div class=" col-md-12">


                <!-- SmartWizard html -->
                <div id="smartwizard" class="sw-main sw-theme-arrows">
                    <ul>
                        <li><a href="#step-1">Datos del Cliente<br />
                            <small>Ingrese los datos del cliente</small></a></li>
                        <li><a href="#step-2">Datos de la orden<br />
                            <small>Ingrese los productos</small></a></li>
                        <li><a href="#step-3">Notas<br />
                            <small>Notas u observaciones</small></a></li>
                        <li><a href="#step-4">Formalizar<br />
                            <small>Formalizar la orden</small></a></li>
                    </ul>

                    <div>

                        <div id="step-1" class="">

                            <div class="col-lg-12" style="padding-top: 50px;">
                                <div class="row">
                                    <div class="col-lg-1 offset-lg-1">
                                        <asp:Label ID="Label6" runat="server" Text="Mesero: "></asp:Label>
                                    </div>
                                    <div class=" col-lg-4 form-group">
                                        <asp:TextBox ID="txtMesero" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4 ">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtMesero" ErrorMessage="Debe ingresar el mesero que atiende"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 text-right">
                                        <asp:Label ID="Label4" runat="server" Text="Nombre Cliente: "></asp:Label>
                                    </div>
                                    <div class="col-lg-4 form-group">
                                        <asp:TextBox ID="txtNombreCliente" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtNombreCliente" ErrorMessage="Debe ingresar el nombre del cliente"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-1 offset-lg-1 text-right">
                                        <asp:Label ID="Label11" runat="server" Text="Mesa: "></asp:Label>
                                    </div>
                                    <div class=" col-lg-2 form-group">
                                        <asp:DropDownList ID="ddlMesas" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMesas_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 text-right">
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

                        <div id="step-2" class="">

                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>

                                    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress2" runat="server" DynamicLayout="true">
                                        <ProgressTemplate>
                                            <div class="loading-panel">
                                                <div class="loading-container">
                                                    <img class="mx-auto d-block" src="Assets/img/loading.svg" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>

                                    <div class="col-lg-12">
                                        <div class="col-lg-6" style="padding-top: 50px;">

                                            <div class="row">
                                                <div class="col-lg-4 text-right">
                                                    <asp:Label ID="Label1" runat="server" Text="Tipo Producto: "></asp:Label>
                                                </div>
                                                <div class=" col-lg-4 form-group">
                                                    <asp:DropDownList ID="ddlTipoProducto" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlTipoProducto_SelectedIndexChanged1" AutoPostBack="true">
                                                        <asp:ListItem Value="0">Refresco</asp:ListItem>
                                                        <asp:ListItem Value="1">Plato Fuerte</asp:ListItem>
                                                        <asp:ListItem Value="2">Postre</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-4 text-right">
                                                    <asp:Label ID="Label12" runat="server" Text="Producto: "></asp:Label>
                                                </div>
                                                <div class=" col-lg-4 form-group">
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
                                                <div class="col-lg-4 text-right">
                                                    <asp:Label ID="Label2" runat="server" Text="Cantidad: "></asp:Label>
                                                </div>
                                                <div class=" col-lg-2 form-group">
                                                    <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" Text="1"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-lg-1 offset-lg-1">
                                                    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-secondary btn-lg" />
                                                </div>
                                            </div>

                                        </div>


                                        <div class="col-lg-6" style="padding-top: 50px;">
                                            <div class="row">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress3" runat="server" DynamicLayout="true">
                                                            <ProgressTemplate>
                                                                <div class="loading-panel">
                                                                    <div class="loading-container">
                                                                        <img class="mx-auto d-block" src="Assets/img/loading.svg"  />
                                                                    </div>
                                                                </div>
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>

                                                        <asp:GridView ID="gvOrden" runat="server" CssClass="table table-bordered table-hover"
                                                            AutoGenerateColumns="false"
                                                            DataKeyNames="IDPRODUCTO,NOMBREPRODUCTO,CANTIDAD"
                                                            AutoGenerateEditButton="false"
                                                            OnRowEditing="gvOrden_RowEditing"
                                                            OnRowCancelingEdit="gvOrden_RowCancelingEdit"
                                                            OnRowDeleting="gvOrden_RowDeleting"
                                                            OnRowUpdating="gvOrden_RowUpdating"
                                                            OnRowDataBound="gvOrden_RowDataBound">


                                                            <Columns>
                                                                <asp:BoundField DataField="IDPRODUCTO" HeaderText="Producto" ReadOnly="True"></asp:BoundField>
                                                                <asp:BoundField DataField="NOMBREPRODUCTO" HeaderText="Producto" ReadOnly="True"></asp:BoundField>
                                                                <asp:TemplateField HeaderText="CANTIDAD">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCantidad" runat="server" Text='<%# Eval("CANTIDAD") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" TextMode="Number" ID="txtCantEdit" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ForeColor="Red" ControlToValidate="txtDescEdit" ErrorMessage="Debe ingresar la cantidad"></asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:CommandField ShowDeleteButton="true" DeleteText="Quitar" ControlStyle-CssClass="btn btn-secondary" />
                                                            </Columns>

                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="step-3" class="">
                            <div class="col-lg-12" style="padding-top: 50px;">

                                <div class="row">
                                    <div class="col-lg-6 text-right">
                                        <h5>
                                            <asp:Label ID="Label5" runat="server" Text="Notas relacionadas con los productos de la orden."></asp:Label></h5>
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 20px;">
                                    <div class="col-lg-2 text-right">
                                        <asp:Label ID="Label3" runat="server" Text="Notas: "></asp:Label>
                                    </div>
                                    <div class=" col-lg-2 form-group">
                                        <asp:TextBox ID="txtNotas" runat="server" CssClass="form-control" TextMode="MultiLine" Text=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="step-4" class="">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server" DynamicLayout="true">
                                        <ProgressTemplate>
                                            <div class="loading-panel">
                                                <div class="loading-container">
                                                    <img class="mx-auto d-block" src="Assets/img/loading.svg" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>

                                    <div class="col-lg-12" style="padding-top: 50px;">
                                        <div class="row">
                                            <div class="col-lg-6 text-right">
                                                <h5>
                                                    <asp:Label ID="Label7" runat="server" Text="Formalice la orden para finalizar."></asp:Label></h5>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 20px;">
                                            <div class="form-group col-lg-1 offset-lg-4">
                                                <asp:Button ID="btnFormalizar" runat="server" OnClick="btnFormalizar_Click" Text="Formalizar" CssClass="btn btn-secondary btn-lg" />
                                            </div>
                                        </div>
                                    </div>

                                    <div runat="server" class="row" id="idErrores" style="display: none;">
                                        <div class="col-lg-12">

                                            <div class="alert alert-danger" role="alert">

                                                <h6>
                                                    <asp:Label ID="lblNombreCliente" runat="server" Text=""></asp:Label></h6>
                                                <h6>
                                                    <asp:Label ID="lblMesa" runat="server" Text=""></asp:Label></h6>
                                                <h6>
                                                    <asp:Label ID="lblLista" runat="server" Text=""></asp:Label></h6>

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
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
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

    <script type="text/javascript">
        $(document).ready(function () {

            // Smart Wizard
            $('#smartwizard').smartWizard({
                selected: 0,
                theme: 'arrows',
                transitionEffect: 'fade',
                toolbarSettings: {
                    toolbarPosition: 'bottom',
                    toolbarExtraButtons: [btnFinish, btnCancel]
                }
            });

            // Step show event
            $("#smartwizard").on("showStep", function (e, anchorObject, stepNumber, stepDirection, stepPosition) {
                //alert("You are on step "+stepNumber+" now");
                if (stepPosition === 'first') {
                    $("#prev-btn").addClass('disabled');
                } else if (stepPosition === 'final') {
                    $("#next-btn").addClass('disabled');
                } else {
                    $("#prev-btn").removeClass('disabled');
                    $("#next-btn").removeClass('disabled');
                }
            });

            // Toolbar extra buttons
            var btnFinish = $('<button></button>').text('Finish')
                                             .addClass('btn btn-info')
                                             .on('click', function () { alert('Finish Clicked'); });
            var btnCancel = $('<button></button>').text('Cancel')
                                             .addClass('btn btn-danger')
                                             .on('click', function () { $('#smartwizard').smartWizard("reset"); });


            // External Button Events
            $("#reset-btn").on("click", function () {
                // Reset wizard
                $('#smartwizard').smartWizard("reset");
                return true;
            });

            $("#prev-btn").on("click", function () {
                // Navigate previous
                $('#smartwizard').smartWizard("prev");
                return true;
            });

            $("#next-btn").on("click", function () {
                // Navigate next
                $('#smartwizard').smartWizard("next");
                return true;
            });

            $("#theme_selector").on("change", function () {
                // Change theme
                $('#smartwizard').smartWizard("theme", $(this).val());
                return true;
            });

            // Set selected theme on page refresh
            $("#theme_selector").change();

        });
    </script>

</asp:Content>
