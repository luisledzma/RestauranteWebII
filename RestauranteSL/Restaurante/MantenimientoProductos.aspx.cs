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
    public partial class MantenimientoProductos : System.Web.UI.Page
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

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                int valor = Convert.ToInt16(ddlCategoria.SelectedValue);

                string categoria = "";

                if (valor ==0)
                {
                    categoria = "Refresco";
                }else
                {
                    if (valor == 1)
                    {
                        categoria = "PlatoFuerte";
                    }else
                    {
                        categoria = "Postre";
                    }
                }

                ProductoE product = new ProductoE();

                
                product.NOMBRE = txtNombre.Text;
                product.DESCRIPCION = txtDesc.Text;
                product.PRECIO = Convert.ToInt16(txtPrecio.Text);
                product.ESTADO = Convert.ToInt16(ddlEstado.SelectedValue);
                product.CATEGORIA = categoria;

                ProductoL.Nuevo(product);
                Response.Redirect("MantenimientoProductos.aspx");
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void refrescarListar()
        {
            List<ProductoE> lista = new List<ProductoE>();
            List<ProductoE> listaFormat = new List<ProductoE>();
            lista = ProductoL.ObtenerTodos();

            int valor = Convert.ToInt16(ddlCategorias.SelectedValue);

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

            foreach (ProductoE elemento in lista)
            {
                if (elemento.CATEGORIA == categoria)
                {
                    listaFormat.Add(elemento);
                }
            }
            grvListado.DataSource = listaFormat;
            grvListado.DataBind();

        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                grvListado.EditIndex = e.NewEditIndex;
                refrescarListar();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void grvListado_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                grvListado.EditIndex = -1;
                refrescarListar();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void grvListado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //Verificando es que sea una fila de datos
                {
                    //Buscar los controles
                    DropDownList ddlEstadoEdit = (e.Row.FindControl("ddlEstadoEdit") as DropDownList);
                    TextBox txtDescEdit = (e.Row.FindControl("txtDescEdit") as TextBox);
                    TextBox txtPrecioEdit = (e.Row.FindControl("txtPrecioEdit") as TextBox);

                    if ((e.Row.RowState & DataControlRowState.Edit) > 0) //Estamos en estado de edición
                    {

                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void grvListado_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //Actualizar
                //Armar instancia
                ProductoE producto = new ProductoE();
                //BoundField 
                //comp.idCompra = Convert.ToInt16(((TextBox)grvListado.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
                producto.ID = Convert.ToInt16(grvListado.Rows[e.RowIndex].Cells[0].Text);
                //TemplateField
                producto.PRECIO = Convert.ToInt16(((TextBox)grvListado.Rows[e.RowIndex].FindControl("txtPrecioEdit")).Text);
                producto.DESCRIPCION = ((TextBox)grvListado.Rows[e.RowIndex].FindControl("txtDescEdit")).Text;
                producto.ESTADO = Convert.ToInt16(((DropDownList)grvListado.Rows[e.RowIndex].FindControl("ddlEstadoEdit")).SelectedValue);
                //Modificar
                ProductoL.Modificar(producto);
                //Refrescar el GridView
                grvListado.EditIndex = -1;
                refrescarListar();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            refrescarListar();
        }
    }
}