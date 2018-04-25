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
            -webkit-filter: blur(10px);
            -moz-filter: blur(10px);
            -ms-filter: blur(10px);
            filter: blur(10px);
        }


        .loading-panel {
    /*background: rgba(0, 0, 0, 0.2) none repeat scroll 0 0;
    position: relative;
    width: 100%;*/
    background: rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
    position: fixed;
    width: 100%;
    height: 100%;
    z-index: 99999999;
    top: 0;
    left: 0;
}

.loading-container {
    /*background: rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
    color: #fff;
    font-size: 90px;
    height: 100%;
    left: 0;
    padding-top: 15%;
    position: fixed;
    text-align: center;
    top: 0;
    width: 100%;
    z-index: 999999;*/
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);
}


        @media (max-width:576px) {
            .alert {
                max-width: 295px;
            }

            .btnModal {
                padding: 6px 3px !important;
                font-size: 15px;
            }

            #btnModal {
                padding-top: 50px;
            }

            h3 {
                font-size: 15px;
            }
        }

        @media (min-width: 577px) and (max-width : 767px) {
            .alert {
                width: 295px;
            }

            .btnModal {
                padding: 8px 4px !important;
                font-size: 17px;
            }

            #btnModal {
                padding-top: 25px;
            }

            h3 {
                font-size: 20px;
            }

            .word {
                font-size: 25px;
            }
        }

        @media (min-width: 768px) and (max-width : 991px) {
            .alert {
                width: 295px;
            }

            .btnModal {
                padding: 10px 5px !important;
                font-size: 20px;
            }

            #btnModal {
                padding-top: 50px;
            }

            h3 {
                font-size: 25px;
            }

            .word {
                font-size: 30px;
            }
        }

        @media (min-width: 992px) and (max-width : 1199px) {
            .alert {
                width: 295px;
            }

            .btnModal {
                padding: 10px 5px !important;
                font-size: 20px;
            }

            #btnModal {
                padding-top: 100px;
            }

            h3 {
                font-size: 30px;
            }

            .word {
                font-size: 40px;
            }
        }

        @media (min-width: 1200px) {
            .alert {
                width: 295px;
            }

            .btnModal {
                padding: 10px 5px !important;
                font-size: 20px;
            }

            #btnModal {
                padding-top: 200px;
            }

            h3 {
                font-size: 40px;
            }

            .word {
                font-size: 50px;
            }
        }



        .container h3 {
            color: snow;
        }


        .pen body {
            padding-top: 50px;
        }




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
            color: #FF3346;
            border-color: #FF3346;
        }

        #btnModal > a:hover {
            background-color: #FF3346;
            color: snow;
            border-color: #FF3346;
        }

        #btnModal > a::selection {
            background-color: #FF3346;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="tsmIngresar" EnablePageMethods="true" runat="server"></asp:ScriptManager>

        <video autoplay="autoplay" loop="loop" muted="muted" poster="screenshot.jpg" id="background">
            <source src="Assets/video/Slicing.mp4" type="video/mp4" />
        </video>
        
        

        <div class="container" style="padding-top: 50px;">
            <div class="row">
                <div class="col-md-6 col-xs-12 col-sm-12 offset-md-3 text-center">
                    <div class="col-md-12 col-xs-12 col-sm-12 mx-auto fadeIn wow" data-wow-duration="1000ms" data-wow-delay="400ms" style="font-family: 'Roboto Condensed',sans-serif;">
                        <h3><b style="color: #FF3346;">Control</b>  del <i class="word">Restaurante</i></h3>
                        <h5></h5>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                        <div id="btnModal" class="col-lg-4 offset-lg-4 col-xs-6 offset-xs-3 font-weight-bold">
                            <a href="#" data-toggle="modal" data-target="#sidebar-right" class="login-desk btn btnModal">Iniciar Sesión<span class="fas fa-sign-in-alt" style="margin-left: 5px;"></span>
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
                                <h3 style="font-family: 'Arial' !important; color:black">
                                    <asp:Label ID="lbl11" runat="server" Text="Restaurante"></asp:Label></h3>
                                <h5 style="font-family: 'Arial' !important;">
                                    <asp:Label ID="lbl12" runat="server" Text="Inicio de Sesión"></asp:Label></h5>
                            </div>
                        </div>
                        <div class="modal-body">

                            <div class="col-lg-12 col-md-12 col-xs-12 form-bg frmlogin" id="divLogin" runat="server" style="border-radius: 20px;">
                                <div class="box">
                                    <div class="title">
                                        <img class="mx-auto d-block img-fluid" src="Assets/img/logoRestaurante.png" />
                                    </div>
                                    <div class="box-content">
                                        <div class="row">
                                            <div class="col-md-12 offset-md-0">
                                                <div class="col-sm-12 col-xs-12">
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                        </div>
                                                        <asp:TextBox CssClass="form-control" name="txtUsuario" required="required" placeholder="Usuario" ID="txtUsuario" autocomplete="off" runat="server" Text=""></asp:TextBox>
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
                                                        <asp:TextBox CssClass="txtLoginEnter form-control" required="required" name="txtContrasena" placeholder="Contraseña" ID="txtContrasena" autocomplete="off" runat="server" TextMode="Password"></asp:TextBox>
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
                                                                            <img class="mx-auto d-block" src="Assets/img/loading.svg" style="width:150px; height:150px;" />
                                                                        </div>
                                                                    </div>

                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>




                                                            <div class="row">
                                                                <div id="errorMsj" style="display: none;" runat="server" class="alert alert-danger">
                                                                    <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>

                                                            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-block btn-dark" Visible="true" OnClick="btnLogin_Click" />

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

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


        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="Scripts/js/jquery-3.0.0.js"></script>
        <script src="Scripts/js/bootstrap.js"></script>
        <script src="Assets/js/wow.js"></script>
        <script src="Assets/js/wow.min.js"></script>

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

            new WOW().init();


            $(document).ready(function () {
                var $magic = $(".magic"),
                    magicWHalf = $magic.width() / 2;
                $(document).on("mousemove", function (e) {
                    $magic.css({ "left": e.pageX - magicWHalf, "top": e.pageY - magicWHalf });
                });
            });




        </script>
    </form>

    <footer class="fixed-bottom">
        <div class="container-fluid py-3 bg-dark text-white mt-4 ">
            <div class="row d-block mx-auto">
                <span class="text-warning">Copyrigth&copy;</span><asp:Label ID="Label1" runat="server" Text="All rights Reserved "></asp:Label>
            </div>
            <div class="row d-block mx-auto">
                <asp:Label ID="Label2" runat="server" Text="Created by: Anthony, Jozsef and Luis "></asp:Label>
            </div>

        </div>
    </footer>


</body>
</html>
