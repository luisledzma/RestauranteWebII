<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Restaurante.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="Content/Bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="Content/Animate/animate.css" rel="stylesheet" />
    <link href="Assets/css/estilos.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway|Roboto+Condensed" rel="stylesheet" />
    

    <style>
        #background {
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
            background: url(polina.jpg) no-repeat;
            background-size: cover;
        }

        .container h1 {
            color: white;
        }


        .pen body {
            padding-top: 50px;
        }



        /* MODAL FADE LEFT RIGHT BOTTOM */
        .modal.fade:not(.in).left .modal-dialog {
            -webkit-transform: translate3d(-25%, 0, 0);
            transform: translate3d(0%, 0, 0);
        }

        .modal.fade:not(.in).right .modal-dialog {
            -webkit-transform: translate3d(25%, 0, 0);
            transform: translate3d(0%, 0, 0);
        }

        .modal.fade:not(.in).bottom .modal-dialog {
            -webkit-transform: translate3d(0, 25%, 0);
            transform: translate3d(0, 0%, 0);
        }

        .modal.right .modal-dialog {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
        }



            .modal.right .modal-dialog.modal-sm {
                max-width: 300px;
            }

        .modal.right .modal-content, .modal.right .modal-content {
            min-height: 100vh;
            border: 0;
        }

        .btnModal {
            border-radius: 30px 30px;
            color:#FF3346;
            border-color:#FF3346;
        }

        #btnModal > a:hover {
            background-color:#FF3346;
            color : snow;
            border-color:#FF3346;
        }

        #btnModal > a::selection {
            background-color:#FF3346;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="tsmIngresar" EnablePageMethods="true" runat="server"></asp:ScriptManager>

        <video autoplay="autoplay" loop="loop" muted="muted" poster="screenshot.jpg" id="background">
            <source src="Assets/video/Slicing.mp4" type="video/mp4" />
        </video>

        <div class="container" style="padding-top: 150px;">
            <div class="row">
                <div class="col-md-6 col-xs-12 offset-md-3 text-center">
                    <div class="col-md-12 mx-auto "   style="font-family: 'Roboto Condensed',sans-serif; font-style: italic ; ">
                        <h1 class="text-uppercase" >
                            <strong>Sistema de control del Restaurante</strong>
                        </h1>
                    </div>
                    <div class="col-lg-12" style="padding-top: 157px;">
                        <div id="btnModal" class="col-lg-4 offset-lg-4 font-weight-bold">
                            <a href="#"  data-toggle="modal" data-target="#sidebar-right" class="login-desk btn btn-lg btnModal">Ingresar <span class="glyphicon glyphicon-log-in" style="margin-left: 5px;"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!--Modal de inicio de sesion -->
            <div class="modal fade right" id="sidebar-right" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times"></span></button>
                            <div class="title col-md-12">
                                <h3 style="font-family: 'Arial' !important; color: black">
                                    <asp:Label ID="lbl11" runat="server" Text="Restaurante"></asp:Label></h3>
                                <h5 style="font-family: 'Arial' !important; color: black">
                                    <asp:Label ID="lbl12" runat="server" Text="Inicio de Sesión"></asp:Label></h5>
                            </div>
                        </div>
                        <div class="modal-body">

                            <div class="col-lg-12 col-md-12 col-xs-12 form-bg frmlogin" id="divLogin" runat="server" style="border-radius: 20px;">
                                <div class="box">
                                    <div class="title">
                                        <img class="offset-2" src="Assets/img/logo.png" />
                                    </div>
                                    <div class="box-content ">
                                        <div class="row">
                                            <div class="col-md-12 offset-md-0">
                                                <div class="col-sm-12 col-xs-12">
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                        </div>
                                                        <asp:TextBox CssClass="form-control" name="txtUsuario" placeholder="Usuario" ID="txtUsuario" autocomplete="off" runat="server" Text=""></asp:TextBox>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 col-md-offset-0">
                                                <div class="col-sm-12 col-xs-12">

                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                                                        </div>
                                                        <asp:TextBox CssClass="txtLoginEnter form-control" name="txtContrasena" placeholder="Contraseña" ID="txtContrasena" autocomplete="off" runat="server" TextMode="Password"></asp:TextBox>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 col-md-offset-0">
                                                <div class="col-sm-12 col-xs-12">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>

                                                            <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgresUpdatePanel1" runat="server" DynamicLayout="true">
                                                                <ProgressTemplate>
                                                                    <div class="loading-panel">
                                                                        <div class="loading-container">
                                                                            <img src="Assets/img/loading.svg" />
                                                                        </div>
                                                                    </div>
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>

                                                            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-block btn-dark" Visible="true" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">

                                        <div class="pull-right">
                                            <a style="color: black" href="#" class="boton">
                                                <asp:Label ID="lbl13" runat="server" Text="">¿Olvidó su contraseña?</asp:Label></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="Scripts/js/jquery-3.0.0.js"></script>
        <script src="Scripts/js/bootstrap.js"></script>

        <!--use just the brands and solid styles-->
        <script src="https://use.fontawesome.com/releases/v5.0.6/js/brands.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.6/js/solid.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.6/js/fontawesome.js"></script>
        
        <script>
            $(document).ready(function () {
                $(".modal a").not(".dropdown-toggle").on("click", function () {
                    $(".modal").modal("hide");
                });
            });

           
        </script>
    </form>

    <footer style="padding-top:200px;">
        <div class="container-fluid py-3 bg-dark text-white mt-4 ">
            <div class="row d-block mx-auto">
                <span class="text-warning">Copyrigth&copy;</span><asp:Label ID="Label1" runat="server" Text="All rights Reserved "></asp:Label>
            </div>
            <div class="row d-block mx-auto">
                <asp:Label ID="Label2" runat="server" Text="Created by: Anthony, Joszef and Luis "></asp:Label>
            </div>

        </div>
    </footer>


</body>
</html>
