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
            try
            {
                if (!IsPostBack)
                {
                    llenarComboMesas();
                    llenarComboProducto();
                    cargarGrid();
                    Session["lstDet"] = new List<DetalleComandaE>();
                }
                infoMesas();
                buscarMesero();
                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void ddlMesas_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
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
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }

            
        }

        private void buscarMesero()
        {
            try
            {
                txtMesero.Text = (Session["Login"] as UsuarioE).NOMBRE;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
            
        }

        private void infoMesas()
        {
            try
            {
                string idMesa = ddlMesas.SelectedValue;

                if (idMesa != "" )
                {
                    List<MesaE> listado = MesaL.ObtenerTodos();
                    MesaE mesa = (listado.Find(elemento => elemento.ID == idMesa));
                    lblDesc.Text = mesa.DESCRIPCION;
                }else
                {
                    lblDesc.Text = "Todas las mesas se encuentran ocupadas";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
            
        }

        public void cargarGrid()
        {
            try
            {
                    gvOrden.DataSource = (Session["lstDet"] as List<DetalleComandaE>);
                    gvOrden.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
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
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void ddlTipoProducto_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                llenarComboProducto();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                
                string idMesa = ddlMesas.SelectedValue;
                bool bandera = false;
                string nombreProducto = ddlProducto.SelectedItem.Text;
                int producto = Convert.ToInt32(ddlProducto.SelectedValue);
                int cantidad = Convert.ToInt32(txtCantidad.Text);
                DetalleComandaE det = new DetalleComandaE();

                det.IDPRODUCTO = producto;
                det.NOMBREPRODUCTO = nombreProducto;
                det.CANTIDAD = cantidad;
                det.IDCOMANDA = "";
                det.NOTAS = "";
                det.SUBTOTAL = 0;

                if((Session["lstDet"] as List<DetalleComandaE>).Count > 0)
                {
                    foreach (DetalleComandaE dc in (Session["lstDet"] as List<DetalleComandaE>))
                    {
                        if (det.IDPRODUCTO == dc.IDPRODUCTO)
                        {
                            dc.CANTIDAD += Convert.ToInt32(txtCantidad.Text);
                            bandera = true;
                        }
                    }

                    if (!bandera)
                    {
                        (Session["lstDet"] as List<DetalleComandaE>).Add(det);
                    }
                }
                else
                {
                    (Session["lstDet"] as List<DetalleComandaE>).Add(det);
                }
                
                
                cargarGrid();
                

            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnFormalizar_Click(object sender, EventArgs e)
        {
            try
            {
                List<DetalleComandaE> lstDet = (Session["lstDet"] as List<DetalleComandaE>);
                if (txtNombreCliente.Text == "")
                {
                    idErrores.Attributes.Add("style", "display:block;");
                    lblNombreCliente.Text = "Debe digitar el nombre del cliente.";
                    return;
                }
                else
                {
                    lblNombreCliente.Text = "";
                }

                if(ddlMesas.SelectedValue == "")
                {
                    idErrores.Attributes.Add("style", "display:block;");
                    lblMesa.Text = "Debe seleccionar la mesa.";
                    return;
                }
                else
                {
                    lblMesa.Text = "";
                }

                if (lstDet.Count == 0)
                {
                    idErrores.Attributes.Add("style", "display:block;");
                    lblLista.Text = "Debe agregar productos a la comanda.";
                    return;
                }
                else
                {
                    lblLista.Text = "";
                }

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
                    dCom.NOMBREPRODUCTO = prod.NOMBRE;
                    dCom.NOTAS = txtNotas.Text;
                    dCom.SUBTOTAL = prod.PRECIO * dCom.CANTIDAD;

                    new DetalleComandaL().Insertar(dCom);
                }

                MesaL.ModificarCondicion(com.IDMESA, "Comanda Registrada");

                Session.Remove("lstDet");
                Response.Redirect("Principal.aspx");
                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void gvOrden_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvOrden.EditIndex = e.NewEditIndex;
                this.cargarGrid();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void gvOrden_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gvOrden.EditIndex = -1;
                cargarGrid();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void gvOrden_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
              
                DetalleComandaE det = new DetalleComandaE();

                int idprod = Convert.ToInt32(gvOrden.DataKeys[e.RowIndex].Values[0].ToString());
                foreach (DetalleComandaE dc in (Session["lstDet"] as List<DetalleComandaE>))
                {
                    if (dc.IDPRODUCTO == idprod)
                    {
                        det = dc;
                    }
                }
                
                (Session["lstDet"] as List<DetalleComandaE>).Remove(det);

                gvOrden.EditIndex = -1;
                cargarGrid();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void gvOrden_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void gvOrden_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //Verificando es que sea una fila de datos
                {
                    //Buscar los controles
                    TextBox txtCantEdit = (e.Row.FindControl("txtCantEdit") as TextBox);

                    if ((e.Row.RowState & DataControlRowState.Edit) > 0) //Estamos en estado de edición
                    {

                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalComandas", "$('#myModal').modal();", true);
                return;
            }
        }
    }
}