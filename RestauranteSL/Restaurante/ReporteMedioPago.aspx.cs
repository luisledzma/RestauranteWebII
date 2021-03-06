﻿using Entidades;
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
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportMPago", "$('#myModal').modal();", true);
                return;
            }
        }


        private void refrescarListar()
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                string fechaI = txtFechaInicial.Text;
                string fechaF = txtFechaFinal.Text;
                string medioP = ddlMedio.SelectedValue;
                lista = FacturaL.ObtenerFacturaPorFechasYMedioPago(fechaI, fechaF, medioP);

                grvListado.DataSource = lista;
                grvListado.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportMPago", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                refrescarListar();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalReportMPago", "$('#myModal').modal();", true);
                return;
            }
        }
    }
}