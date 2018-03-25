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
    public partial class GestionComandas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenarComboMesas();
            }
            infoMesas();
            buscarMesero();
            llenarComboProducto();
        }

        protected void ddlMesas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void llenarComboMesas()
        {

            List<MesaE> listado = MesaL.ObtenerTodos();
            List<MesaE> lista = new List<MesaE>();

            foreach (MesaE item in listado)
            {
                if(item.CONDICION == "Desocupada")
                {
                    lista.Add(item);
                }
            }

            ddlMesas.DataSource = lista;
            ddlMesas.DataTextField = "ID";
            ddlMesas.DataValueField = "ID";
            ddlMesas.DataBind();
        }

        private void buscarMesero()
        {
            UsuarioE user = UsuarioL.SeleccionarPorId((Session["Login"] as UsuarioE).IDENTIFICACION);
            txtMesero.Text = user.IDENTIFICACION;
        }

        private void infoMesas()
        {
            string idMesa = ddlMesas.SelectedValue;

            if (idMesa != "" || idMesa!= null)
            {
                List<MesaE> listado = MesaL.ObtenerTodos();
                MesaE mesa = (listado.Find(elemento => elemento.ID == idMesa));
                lblDesc.Text = mesa.DESCRIPCION;
            }
            
        }

        private void llenarComboProducto()
        {
            int valor = Convert.ToInt16(ddlTipoProducto.SelectedValue);

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
            ddlProducto.DataSource = ProductoL.ObtenerPorCategoria(categoria);
            ddlProducto.DataTextField = "NOMBRE";
            ddlProducto.DataValueField = "ID";
            ddlProducto.DataBind();
        }

        protected void ddlTipoProducto_SelectedIndexChanged1(object sender, EventArgs e)
        {
            llenarComboProducto();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}