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
    public partial class ReporteFecha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    buscarFechaHoy();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void buscarFechaHoy()
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                List<FacturaE> listaFormat = new List<FacturaE>();
                lista = FacturaL.ObtenerFacturas();

                foreach (FacturaE elemento in lista)
                {
                    if (elemento.FECHA == DateTime.Today.ToShortDateString())
                    {
                        listaFormat.Add(elemento);
                    }
                }

                grvListado.DataSource = listaFormat;
                grvListado.DataBind();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string fechaI = txtFechaInicial.Text;
                DateTime fechaInicial = Convert.ToDateTime(fechaI);

                string fechaF = txtFechaInicial.Text;
                DateTime fechaFinal = Convert.ToDateTime(fechaF);

                List<FacturaE> lista = new List<FacturaE>();
                List<FacturaE> listaFormat = new List<FacturaE>();
                lista = FacturaL.ObtenerFacturas();

                foreach (FacturaE elemento in lista)
                {
                    DateTime fecha = Convert.ToDateTime(elemento.FECHA);
                    if (fecha >= fechaInicial && fecha<=fechaFinal)
                    {
                        listaFormat.Add(elemento);
                    }
                }

                grvListado.DataSource = listaFormat;
                grvListado.DataBind();
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}