<%@ Page Title="Mantenimiento Productos" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="MantenimientoProductos.aspx.cs" Inherits="Restaurante.MantenimientoProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top:50px;">
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtId" ErrorMessage="Debe ingresar el codigo del producto."></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="lblId" runat="server" Text="Código de Producto: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtCantidad" ErrorMessage="Debe ingresar la cantidad de productos."></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="lblCantidad" runat="server" Text="Cantidad: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                             <div class="row">
                                <div class="col-lg-5 text-right">
                                    <asp:Label ID="lblCategoria" runat="server" Text="Categoría: "></asp:Label>
                                </div>
                                <div class=" col-lg-7 form-group">
                                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Categoria 1</asp:ListItem>
                                        <asp:ListItem Value="1">Categoria 2</asp:ListItem>
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
                                    <asp:Button ID="btnRegistrar" runat="server" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-secondary btn-lg" />
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
                        <div class="card-body">Aqui va la tabla con la lista de productos (Insertar, Modificar, Desactivar)</div>
                    </div>
                </div>
            </div>
            <!-- Content Panel -->
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
