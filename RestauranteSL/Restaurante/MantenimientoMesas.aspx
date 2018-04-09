<%@ Page Title="" Language="C#" MasterPageFile="~/RST.Master" AutoEventWireup="true" CodeBehind="MantenimientoMesas.aspx.cs" Inherits="Restaurante.MantenimientoMesas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container wow fadeIn" data-wow-duration="1000ms" data-wow-delay="200ms" style="padding-top: 50px; padding-bottom: 50px;">
        <div class="container-fluid">
            <div id="accordion1" role="tablist">
                <div class="card">
                    <div class="card-header alert alert-success alert-heading" role="tab" id="headingOne1">
                        <h5 class="mb-0"><a class="nav-link nav-item" data-toggle="collapse" href="#collapseOne1" role="button" aria-expanded="true" aria-controls="collapseOne1">Registro de Mesas </a></h5>
                    </div>
                    <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordion1">
                        <div class="col-lg-5 offset-lg-2" style="padding-top: 50px;">

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtId" ErrorMessage="Debe ingresar la Identificación de la mesa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="lblId" runat="server" Text="Identificación"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtDesc" ErrorMessage="Debe ingresar la Descripción de la mesa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label2" runat="server" Text="Descripción"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label10" runat="server" Text="Estado"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Inactiva</asp:ListItem>
                                        <asp:ListItem Value="1">Activa</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 text-right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ValidationGroup="FormRegistro" ControlToValidate="txtCond" ErrorMessage="Debe ingresar la Condición de la mesa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Label ID="Label7" runat="server" Text="Condición"></asp:Label>
                                </div>
                                <div class=" col-lg-8 form-group">
                                    <asp:TextBox ID="txtCond" runat="server" ReadOnly="true" Text="Desocupada" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row">
                                <div class="form-group col-lg-4 offset-lg-4">
                                    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" ValidationGroup="FormRegistro" Text="Agregar" CssClass="btn btn-secondary btn-lg" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header alert alert-success alert-heading" role="tab" id="headingTwo1">
                        <h5 class="mb-0"><a class="collapsed nav-link nav-item" data-toggle="collapse" href="#collapseTwo1" role="button" aria-expanded="false" aria-controls="collapseTwo1">Listado de Mesas</a></h5>
                    </div>
                    <div id="collapseTwo1" class="collapse" role="tabpanel" aria-labelledby="headingTwo1" data-parent="#accordion1">
                        <div class="col-lg-11 offset-lg-1" style="padding-top: 50px;">
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
                                            AutoGenerateColumns="false"
                                            DataKeyNames="ID"
                                            AutoGenerateEditButton="false"
                                            OnRowEditing="grvListado_RowEditing"
                                            OnRowCancelingEdit="grvListado_RowCancelingEdit"
                                            OnRowDataBound="grvListado_RowDataBound"
                                            OnRowUpdating="grvListado_RowUpdating">



                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="Identificaci&#243;n" ReadOnly="True"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Descripci&#243;n">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescEdit" runat="server" Text='<%# Eval("DESCRIPCION") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtDescEdit" runat="server" Text='<%# Eval("DESCRIPCION") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ForeColor="Red" ControlToValidate="txtDescEdit" ErrorMessage="La Descripción es requerida"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

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

                                                <asp:TemplateField HeaderText="Condici&#243;n">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCondEdit" runat="server" Text='<%# Eval("CONDICION") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtCondEdit" runat="server" Text='<%# Eval("CONDICION") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ForeColor="Red" ControlToValidate="txtCondEdit" ErrorMessage="La Condición es requerida"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="true" EditText="Editar" ControlStyle-CssClass="btn btn-secondary" />
                                            </Columns>

                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Content Panel -->
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
