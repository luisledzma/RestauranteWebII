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
    public partial class ReporteVarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    llenarComboMesas();
                    llenarComboMeseros();
                    llenarComboProductos();
                }
                
            }
            catch (Exception)
            {

                throw;
            }
        }


        private void refrescarListarMesas()
        {
            try
            {
                string fechaIm = txtFechaInicialM.Text;
                string fechaFm = txtFechaFinalM.Text;
                string valor = ddlMesas.SelectedValue;
                string parametro = "MESA";
                List<FacturaE> lista = FacturaL.ObtenerFacturaPorFechasYVarios(fechaIm, fechaFm, valor, parametro);
               
                grvListaMesas.DataSource = lista;
                grvListaMesas.DataBind();

            }
            catch (Exception ex)
            {

                throw;
            }
           
        }

        private void refrescarListarMeseros()
        {
            try
            {
                string fechaImr = txtFechaInicialMr.Text;
                string fechaFmr = txtFechaFinalMr.Text;
                string valor = ddlMeseros.SelectedValue;
                string parametro = "MESERO";
                List<FacturaE> lista = FacturaL.ObtenerFacturaPorFechasYVarios(fechaImr, fechaFmr, valor, parametro);
                
                grvListaMeseros.DataSource = lista;
                grvListaMeseros.DataBind();

            }
            catch (Exception ex)
            {

                throw;
            }

        }

        private void llenarComboMesas()
        {
            try
            {
                List<MesaE> listado = MesaL.ObtenerTodos();
                
                ddlMesas.DataSource = listado;
                ddlMesas.DataTextField = "ID";
                ddlMesas.DataValueField = "ID";
                ddlMesas.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void llenarComboProductos()
        {
            try
            {
                List<ProductoE> lista = ProductoL.ObtenerTodos();

                ddlProducto.DataSource = lista;
                ddlProducto.DataTextField = "NOMBRE";
                ddlProducto.DataValueField = "ID";
                ddlProducto.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void llenarComboMeseros()
        {
            try
            {
                List<UsuarioE> listado = UsuarioL.ObtenerTodos();
                
                ddlMeseros.DataSource = listado;
                ddlMeseros.DataTextField = "NOMBRE";
                ddlMeseros.DataValueField = "IDENTIFICACION";
                ddlMeseros.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }


      

        private void refrescarListarProducto()
        {
            try
            {

                string fechaIP = txtFechaInicialP.Text;
                string fechaFP = txtFechaFinalP.Text;
                string producto = ddlProducto.SelectedValue;
                List<FacturaLineaE> lista = FacturaLineaL.SeleccionarFLPorProductoYFecha(fechaIP,fechaFP,producto);
                
                grvListaProduct.DataSource = lista;
                grvListaProduct.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportVarios", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnBuscarM_Click(object sender, EventArgs e)
        {
            try
            {
                refrescarListarMesas();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportVarios", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnBuscarMr_Click(object sender, EventArgs e)
        {
            try
            {
                refrescarListarMeseros();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportVarios", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnBuscarP_Click(object sender, EventArgs e)
        {
            try
            {
                refrescarListarProducto();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportVarios", "$('#myModal').modal();", true);
                return;
            }
        }
    }
}