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
    public partial class ReporteTipoPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    refrescarListar();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void ddlMedio_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                refrescarListar();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void refrescarListar()
        {
            List<FacturaE> lista = new List<FacturaE>();
            List<FacturaE> listaFormat = new List<FacturaE>();
            lista = FacturaL.ObtenerFacturas();

            int valor = Convert.ToInt16(ddlMedio.SelectedValue);

            string categoria = "";

            if (valor == 0)
            {
                categoria = "Efectivo";
            }
            else
            {
                if (valor == 1)
                {
                    categoria = "Electronico";
                }
            }

            foreach (FacturaE elemento in lista)
            {
                if (elemento.TIPOPAGO == categoria)
                {
                    listaFormat.Add(elemento);
                }
            }
            grvListado.DataSource = listaFormat;
            grvListado.DataBind();

        }
    }
}