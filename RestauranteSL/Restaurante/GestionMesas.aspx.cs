using Entidades;
using Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Restaurante
{
    public partial class GestionMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        public string cargarMesas()
        {
            try
            {
                string valor = "";
                List<MesaE> mesas = MesaL.ObtenerTodos();
                foreach (MesaE mesa in mesas)
                {
                    valor += "<div class='card col-md-2 offset-lg-1 col-lg-2 wow fadeIn' data-wow-duration='1000ms' data-wow-delay='400ms'>" +
                    "<img class='card-img-top' src='Assets/img/mesa2.png' />" +
                    "<div class='card-body'>" +
                        "<h5 class='card-title'>" + mesa.ID + "</h5>" +
                        "<p class='card-text' style='font-size:13px;'>Condición:" + mesa.CONDICION + " </p>" +
                        "<a class='btn btn-sm btn-primary' data-mesa='"+mesa.ID+"' onclick='verComanda(this);' >Ver Detalles</a>"+
                    "</div>" +
                    "</div>";
                }

                return valor;
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void btnCargarComanda_Click(object sender, EventArgs e)
        {
            try
            {
                string mesa = hfMesas.Value;
                ComandaE miComanda = new ComandaL().SeleccionarComandaPorMesa(mesa);
                
                if(miComanda.ID != null)
                {
                    List<DetalleComandaE> detComanda = new DetalleComandaL().SeleccionarDetalleComanda(miComanda.ID);
                    grvProductos.DataSource = detComanda;
                    grvProductos.DataBind();
                    UsuarioE mesero = UsuarioL.SeleccionarPorId(miComanda.IDMESERO);

                    decimal total = 0;
                    decimal impuestos = 0;
                    decimal servicio = 0;
                    string notas = "";
                    foreach (DetalleComandaE dc in detComanda)
                    {
                        total += dc.SUBTOTAL;
                        notas = dc.NOTAS;
                    }
                    impuestos = total * Convert.ToDecimal(0.13);
                    servicio = total * Convert.ToDecimal(0.10);

                    txtNotas.Text = notas;
                    txtTotal.Text = (total + impuestos+servicio ).ToString();

                    btnCargarComanda.Visible = false;
                    existeComanda.Attributes.Add("style", "display:normal;");
                    lblComanda.Text = miComanda.ID;
                    txtMesero.Text = mesero.NOMBRE + " " + mesero.APELLIDOS;
                    txtCliente.Text = miComanda.NOMBRECLIENTE;
                    if (miComanda.ESTADO == "Registrada")
                    {
                        idEstado.Attributes.Add("style", "display:normal;");
                        btnGuardar.Visible=true;
                        txtEstadoActual.Text = "Registrada";
                        ddlEstado.Items.Add("En Proceso");
                    }
                    if(miComanda.ESTADO == "En Proceso")
                    {
                        idEstado.Attributes.Add("style", "display:normal;");
                        btnGuardar.Visible = true;
                        txtEstadoActual.Text = "En Proceso";
                        ddlEstado.Items.Add("Pendiente");
                    }
                    
                    if (miComanda.ESTADO == "Pendiente")
                    {
                        idEstado.Attributes.Add("style", "display:normal;");
                        btnGuardar.Visible = true;
                        txtEstadoActual.Text = "Pendiente";
                        ddlEstado.Items.Add("Entregada");
                    }
                    if (miComanda.ESTADO == "Entregada")
                    {
                        txtEstadoActual.Text = "Entregada";
                        pagar.Attributes.Add("style", "display:normal; padding-top:30px;");
                    }
                    
                }
                else
                {
                    msjAlert.Attributes.Add("style", "display:normal;");
                } 


                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMesas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "comandaModal", "$('#comandaModal').modal('hide');", true);
                btnCargarComanda.Visible = true;
                existeComanda.Attributes.Add("style", "display:none;");
                msjAlert.Attributes.Add("style", "display:none;");
                pagar.Attributes.Add("style", "display:none;");
                btnGuardar.Visible = false;
                ddlEstado.Items.Clear();
                lblComanda.Text = "";
                txtMesero.Text = "";
                txtCliente.Text = "";
                grvProductos.DataSource = null;
                grvProductos.DataBind();

            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMesas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string comanda = lblComanda.Text;
                string estado = ddlEstado.SelectedValue;
                string mesa = hfMesas.Value;
                ComandaE com = new ComandaE()
                {
                    ID=comanda,
                    IDMESA = mesa,
                    ESTADO=estado
                };
                if (estado == "En Proceso")
                {
                    MesaL.ModificarCondicion(com.IDMESA, "Ocupada");
                }
                if(estado == "Entregada")
                {
                    MesaL.ModificarCondicion(com.IDMESA, "Por Pagar");
                }
                new ComandaL().ActualizarEstadoComanda(com);
                Response.Redirect("GestionMesas.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMesas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            try
            {
                string mesa = hfMesas.Value;
                ComandaE miComanda = new ComandaL().SeleccionarComandaPorMesa(mesa);
                if(miComanda.ID != null)
                {
                    Session["miComanda"] = miComanda;
                    Response.Redirect("Pago.aspx");
                }
                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMesas", "$('#myModal').modal();", true);
                return;
            }
        }



    }
}