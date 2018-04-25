<%@ Page Title="Mantenimiento Productos" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="MantenimientoProductos.aspx.cs" Inherits="Restaurante.MantenimientoProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px;">
        <div class="container-fluid">
            <div id="accordion1" role="tablist">
                <div class="card">
                    <div class="card-header alert alert-success alert-heading " role="tab" id="headingOne1">
                        <h5 class="mb-0 nav-item"><a class="nav-link" data-toggle="collapse" href="#collapseOne1" role="button" aria-expanded="true" aria-controls="collapseOne1">Registro de productos</a></h5>
                    </div>
                    <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordion1">

                        <div class="col-lg-5 offset-lg-2" style="padding-top: 50px;">

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtNombre" ErrorMessage="Debe ingresar el nombre del producto."></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="Label1" runat="server" Text="Nombre del Producto: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtDesc" ErrorMessage="Debe ingresar la Descripción del producto."></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtPrecio" ErrorMessage="Debe ingresar el precio del producto."></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Precio del Producto: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="lblCategoria" runat="server" Text="Categoría: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Refresco</asp:ListItem>
                                        <asp:ListItem Value="1">Plato Fuerte</asp:ListItem>
                                        <asp:ListItem Value="2">Postre</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="lblEstado" runat="server" Text="Estado: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                        <asp:ListItem Value="1">Activo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>


                            <div class="row">
                                <div class="form-group col-lg-4 offset-lg-5">
                                    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-secondary btn-lg" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header alert alert-success alert-heading" role="tab" id="headingTwo1">
                        <h5 class="mb-0"><a class="collapsed nav-link nav-item" data-toggle="collapse" href="#collapseTwo1" role="button" aria-expanded="false" aria-controls="collapseTwo1">Listado de Productos</a></h5>
                    </div>
                    <div id="collapseTwo1" class="collapse" role="tabpanel" aria-labelledby="headingTwo1" data-parent="#accordion1">
                        <div class="row">
                            <div class="col-lg-2 text-right">
                                <asp:Label ID="Label4" runat="server" Text="Categorias"></asp:Label>
                            </div>
                            <div class=" col-lg-3 form-group">
                                <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">Refresco</asp:ListItem>
                                    <asp:ListItem Value="1">Plato Fuerte</asp:ListItem>
                                    <asp:ListItem Value="2">Postre</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-11 offset-lg-1" style="padding-top: 50px;">
                            <div class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server" DynamicLayout="true">
                                            <ProgressTemplate>
                                                <div class="loading-panel">
                                                    <div class="loading-container">
                                                        <img class="mx-auto d-block" src="Assets/img/loading.svg"  />
                                                    </div>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:GridView ID="grvListado" runat="server" CssClass="table table-bordered table-hover"
                                            AutoGenerateColumns="false"
                                            DataKeyNames="ID"
                                            OnRowEditing="grvListado_RowEditing"
                                            OnRowCancelingEdit="grvListado_RowCancelingEdit"
                                            OnRowDataBound="grvListado_RowDataBound"
                                            OnRowUpdating="grvListado_RowUpdating">


                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="C&#243;digo" ReadOnly="true"></asp:BoundField>
                                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ReadOnly="true"></asp:BoundField>

                                                <asp:TemplateField HeaderText="Descripci&#243;n">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("DESCRIPCION") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtDescEdit" runat="server" Text='<%# Eval("DESCRIPCION") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ForeColor="Red" ControlToValidate="txtDescEdit" ErrorMessage="La Descripción es requerida"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Precio">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("PRECIO") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtPrecioEdit" runat="server" Text='<%# Eval("PRECIO") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ForeColor="Red" ControlToValidate="txtPrecioEdit" ErrorMessage="El Precio es requerido"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="CATEGORIA" HeaderText="Categoria" ReadOnly="true"></asp:BoundField>

                                                <asp:TemplateField HeaderText="Estado">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList CssClass="form-control" ID="ddlEstadoEdit" runat="server">
                                                            <asp:ListItem Value="0">Inactiva</asp:ListItem>
                                                            <asp:ListItem Value="1">Activa</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEstadoEdit" runat="server" Text='<%# Eval("ESTADO") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="true" EditText="Editar" ControlStyle-CssClass="btn btn-secondary" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlCategorias" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Panel -->
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
