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
                    refrescarListarMesas();
                    refrescarListarMeseros();
                    refrescarListarProducto();
                }
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlMesas_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                refrescarListarMesas();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void refrescarListarMesas()
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                List<FacturaE> listaFormat = new List<FacturaE>();
                lista = FacturaL.ObtenerFacturas();

                string valor = ddlMesas.SelectedValue;


                foreach (FacturaE elemento in lista)
                {
                    if (elemento.IDMESA == valor)
                    {
                        listaFormat.Add(elemento);
                    }
                }
                grvListaMesas.DataSource = listaFormat;
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
                List<FacturaE> lista = new List<FacturaE>();
                List<FacturaE> listaFormat = new List<FacturaE>();
                lista = FacturaL.ObtenerFacturas();

                string valor = ddlMeseros.SelectedValue;


                foreach (FacturaE elemento in lista)
                {
                    if (elemento.IDMESERO == valor)
                    {
                        listaFormat.Add(elemento);
                    }
                }
                grvListaMeseros.DataSource = listaFormat;
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

        protected void ddlMeseros_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                refrescarListarMeseros();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void ddlProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            refrescarListarProducto();
        }

        private void refrescarListarProducto()
        {
            try
            {
                int valor = Convert.ToInt16(ddlProducto.SelectedValue);

                string categoria = "";

                if (valor == 0)
                {
                    categoria = "Refresco";
                }
                else
                {
                    if (valor == 1)
                    {
                        categoria = "PlatoFuerte";
                    }
                    else
                    {
                        categoria = "Postre";
                    }
                }

                List<FacturaLineaE> facturas = FacturaLineaL.ObtenerTodos();
                List<FacturaLineaE> lista = new List<FacturaLineaE>();
                List<ProductoE> productos = ProductoL.ObtenerTodos();

                foreach (FacturaLineaE fact in facturas)
                {
                    foreach (ProductoE item in productos)
                    {
                        if (fact.IDPRODUCTO == item.ID)
                        {
                            if (item.CATEGORIA == categoria)
                            {
                                lista.Add(fact);
                            }
                        }
                    }
                }


                grvListaProduct.DataSource = lista;
                grvListaProduct.DataBind();
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}