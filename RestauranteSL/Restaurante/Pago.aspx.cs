using Entidades;
using Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante
{
    public partial class Pago : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["miComanda"] == null)
                {
                    Response.Redirect("Principal.aspx");
                }
                else
                {
                    cargarSaldos();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        private void cargarSaldos()
        {
            try
            {
                ComandaE com = (Session["miComanda"] as ComandaE);
                List<DetalleComandaE> detComanda = new DetalleComandaL().SeleccionarDetalleComanda(com.ID);
                decimal subtotal = 0;
                decimal impuestos = 0;
                decimal servicio = 0;
                foreach (DetalleComandaE dc in detComanda)
                {
                    subtotal += dc.SUBTOTAL;
                }
                impuestos = subtotal * Convert.ToDecimal(0.13);
                servicio = subtotal * Convert.ToDecimal(0.10);
                txtSubtotal.Text = subtotal.ToString();
                txtIV.Text = impuestos.ToString();
                txtServicio.Text = servicio.ToString();
                txtTotal.Text = (subtotal + impuestos + servicio).ToString();

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnAceptarEl_Click(object sender, EventArgs e)
        {
            try
            {
                FacturaLineaL facLlogic = new FacturaLineaL();
                if(new FuncionesL().validarTarjeta(txtNumTarjeta.Text))
                {

                    string numT = txtNumTarjeta.Text;
                    string tipoT = ddlTarjeta.SelectedValue;
                    string fechaV = ddlMesVencimiento.SelectedValue + "-" + ddlAnnoVencimiento.SelectedValue;
                    string cvc = txtCVC.Text;

                    ComandaE com = (Session["miComanda"] as ComandaE);
                    List<DetalleComandaE> detComanda = new DetalleComandaL().SeleccionarDetalleComanda(com.ID);

                    ParametrosE p = new ParametrosL().SeleccionarConsecutivo("FACTURA");
                    string consec = new ParametrosL().CalcularConsecutivo(p);
                    ParametrosE pr = new ParametrosE();
                    pr.PARAMETRO = "FACTURA";
                    pr.CONSECUTIVO = consec;
                    new ParametrosL().Modificar(pr);
                    
                    FacturaE miFactura = new FacturaE()
                    {
                        ID=consec,
                        IDMESERO = com.IDMESERO,
                        IDMESA = com.IDMESA,
                        IDCOMANDA = com.ID,
                        FECHA = (DateTime.Today).ToString(),
                        CLIENTE = com.NOMBRECLIENTE,
                        TIPOPAGO = "Electronico",
                        TOTAL = Convert.ToDecimal(txtTotal.Text)
                    };

                    new FacturaL().InsertarFactura(miFactura);

                    List<FacturaLineaE> lstFacLinea = new List<FacturaLineaE>();

                    foreach (DetalleComandaE detCom in detComanda)
                    {
                        FacturaLineaE miFacLinea = new FacturaLineaE()
                        {
                            IDFACTURA = consec,
                            IDPRODUCTO = detCom.IDPRODUCTO,
                            NOMBREPRODUCTO = detCom.NOMBREPRODUCTO,
                            CANTIDAD = detCom.CANTIDAD,
                            NOTAS = detCom.NOTAS,
                            IMPUESTOVENTAS = (detCom.SUBTOTAL * Convert.ToDecimal( 0.13)),
                            SERVICIO = (detCom.SUBTOTAL * Convert.ToDecimal(0.10)),
                            SUBTOTAL = detCom.SUBTOTAL
                        };
                        lstFacLinea.Add(miFacLinea);
                    }

                    foreach (FacturaLineaE facLin in lstFacLinea)
                    {
                        facLlogic.InsertarFacturaLinea(facLin);
                    }
                    MesaL.ModificarCondicion(com.IDMESA, "Desocupada");
                    ComandaE c = new ComandaE()
                    {
                        ID= com.ID,
                        ESTADO = "Finalizada"
                    };
                    new ComandaL().ActualizarEstadoComanda(c);

                    Session.Remove("miComanda");
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PagoExitoso", "$('#modalPagoExitoso').modal();", true);

                }
                else
                {
                    lblMsjError.Text = "El número de tarjeta es inválido.";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ErrorPago", "$('#idErrorPago').modal();", true);
                    return;
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnCancelarEl_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("miComanda");
                Response.Redirect("GestionMesas.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnAceptarEf_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPagaCon.Text == "")
                {
                    lblMsjError.Text = "Debe digitar el monto a pagar.";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ErrorPago", "$('#idErrorPago').modal();", true);
                    return;
                }
                FacturaLineaL facLlogic = new FacturaLineaL();
                decimal pagaCon = Convert.ToDecimal(txtPagaCon.Text);
                decimal total = Convert.ToDecimal(txtTotal.Text);
                

                if (pagaCon >= total)
                {
                    ComandaE com = (Session["miComanda"] as ComandaE);
                    List<DetalleComandaE> detComanda = new DetalleComandaL().SeleccionarDetalleComanda(com.ID);

                    ParametrosE p = new ParametrosL().SeleccionarConsecutivo("FACTURA");
                    string consec = new ParametrosL().CalcularConsecutivo(p);
                    ParametrosE pr = new ParametrosE();
                    pr.PARAMETRO = "FACTURA";
                    pr.CONSECUTIVO = consec;
                    new ParametrosL().Modificar(pr);

                    FacturaE miFactura = new FacturaE()
                    {
                        ID = consec,
                        IDMESERO = com.IDMESERO,
                        IDMESA = com.IDMESA,
                        IDCOMANDA = com.ID,
                        FECHA = (DateTime.Today).ToString(),
                        CLIENTE = com.NOMBRECLIENTE,
                        TIPOPAGO = "Efectivo",
                        TOTAL = Convert.ToDecimal(txtTotal.Text)
                    };

                    new FacturaL().InsertarFactura(miFactura);

                    List<FacturaLineaE> lstFacLinea = new List<FacturaLineaE>();

                    foreach (DetalleComandaE detCom in detComanda)
                    {
                        FacturaLineaE miFacLinea = new FacturaLineaE()
                        {
                            IDFACTURA = consec,
                            IDPRODUCTO = detCom.IDPRODUCTO,
                            NOMBREPRODUCTO = detCom.NOMBREPRODUCTO,
                            CANTIDAD = detCom.CANTIDAD,
                            NOTAS = detCom.NOTAS,
                            IMPUESTOVENTAS = (detCom.SUBTOTAL * Convert.ToDecimal(0.13)),
                            SERVICIO = (detCom.SUBTOTAL * Convert.ToDecimal(0.10)),
                            SUBTOTAL = detCom.SUBTOTAL
                        };
                        lstFacLinea.Add(miFacLinea);
                    }

                    foreach (FacturaLineaE facLin in lstFacLinea)
                    {
                        facLlogic.InsertarFacturaLinea(facLin);
                    }
                    MesaL.ModificarCondicion(com.IDMESA, "Desocupada");
                    ComandaE c = new ComandaE()
                    {
                        ID = com.ID,
                        ESTADO = "Finalizada"
                    };
                    new ComandaL().ActualizarEstadoComanda(c);

                    Session.Remove("miComanda");
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PagoExitoso", "$('#modalPagoExitoso').modal();", true);

                }
                else
                {
                    lblMsjError.Text = "El saldo con el que paga es menor que el total a pagar.";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ErrorPago", "$('#idErrorPago').modal();", true);
                    return;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnCancelarEf_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("miComanda");
                Response.Redirect("GestionMesas.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}