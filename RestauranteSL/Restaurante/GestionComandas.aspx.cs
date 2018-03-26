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
        private static List<DetalleComandaE> lstDet = new List<DetalleComandaE>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    llenarComboMesas();
                }
                infoMesas();
                buscarMesero();
                llenarComboProducto();
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

            }
            catch (Exception)
            {

                throw;
            }
        }

        private void llenarComboMesas()
        {

            try
            {
                List<MesaE> listado = MesaL.ObtenerTodos();
                List<MesaE> lista = new List<MesaE>();

                foreach (MesaE item in listado)
                {
                    if (item.CONDICION == "Desocupada")
                    {
                        lista.Add(item);
                    }
                }

                ddlMesas.DataSource = lista;
                ddlMesas.DataTextField = "ID";
                ddlMesas.DataValueField = "ID";
                ddlMesas.DataBind();
            }
            catch (Exception)
            {

                throw;
            }

            
        }

        private void buscarMesero()
        {
            try
            {
                txtMesero.Text = (Session["Login"] as UsuarioE).NOMBRE;
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        private void infoMesas()
        {
            try
            {
                string idMesa = ddlMesas.SelectedValue;

                if (idMesa != "" || idMesa != null)
                {
                    List<MesaE> listado = MesaL.ObtenerTodos();
                    MesaE mesa = (listado.Find(elemento => elemento.ID == idMesa));
                    lblDesc.Text = mesa.DESCRIPCION;
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public void cargarGrid()
        {
            try
            {
                gvOrden.DataSource = lstDet;
                gvOrden.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void llenarComboProducto()
        {

            try
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
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlTipoProducto_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                llenarComboProducto();
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                int producto = Convert.ToInt32(ddlProducto.SelectedValue);
                int cantidad = Convert.ToInt32(txtCantidad.Text);
                DetalleComandaE det = new DetalleComandaE();
                det.IDPRODUCTO = producto;
                det.CANTIDAD = cantidad;

                lstDet.Add(det);
                cargarGrid();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnFormalizar_Click(object sender, EventArgs e)
        {
            try
            {
                ParametrosE p = new ParametrosL().SeleccionarConsecutivo("COMANDA");
                string consec = new ParametrosL().CalcularConsecutivo(p);
                ParametrosE pr = new ParametrosE();
                pr.PARAMETRO = "COMANDA";
                pr.CONSECUTIVO = consec;
                new ParametrosL().Modificar(pr);

                ComandaE com = new ComandaE()
                {
                    ID = consec,
                    IDMESERO = (Session["Login"] as UsuarioE).IDENTIFICACION,
                    NOMBRECLIENTE = txtNombreCliente.Text,
                    IDMESA = ddlMesas.SelectedValue,
                    ESTADO = "Registrada"
                };

                new ComandaL().Insertar(com);

                foreach (DetalleComandaE dCom in lstDet)
                {
                    dCom.IDCOMANDA = consec;
                    ProductoE prod = new ProductoL().ObtenerProductoPorID(dCom.IDPRODUCTO);
                    dCom.NOTAS = txtNotas.Text;
                    dCom.SUBTOTAL = prod.PRECIO * dCom.CANTIDAD;

                    new DetalleComandaL().Insertar(dCom);
                }

                lstDet.Clear();
                Response.Redirect("Principal.aspx");
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvOrden_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvOrden.EditIndex = e.NewEditIndex;
                this.cargarGrid();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvOrden_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gvOrden.EditIndex = -1;
                cargarGrid();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}