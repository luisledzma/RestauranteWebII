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
    public partial class MantenimientoMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlEstado.SelectedIndex = 0;
                refrescarListar();
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MesaE mesa = new MesaE();

            mesa.ID = txtId.Text;
            mesa.DESCRIPCION = txtDesc.Text;
            mesa.ESTADO = Convert.ToInt16( ddlEstado.SelectedValue);
            mesa.CONDICION = txtCond.Text;

            MesaL.Nuevo(mesa);
            Response.Redirect("MantenimientoMesas.aspx");
        }

        private void refrescarListar()
        {
            List<MesaE> lista = new List<MesaE>();
            lista = MesaL.ObtenerTodos();
            grvListado.DataSource = lista;
            grvListado.DataBind();
        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvListado.EditIndex = e.NewEditIndex;
            refrescarListar();
        }

        protected void grvListado_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvListado.EditIndex = -1;
            refrescarListar();
        }

        protected void grvListado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) //Verificando es que sea una fila de datos
            {
                //Buscar los controles
                DropDownList ddlEstadoEdit = (e.Row.FindControl("ddlEstadoEdit") as DropDownList);
                TextBox txtDescEdit = (e.Row.FindControl("txtDescEdit") as TextBox);
                TextBox txtCondEdit = (e.Row.FindControl("txtCondEdit") as TextBox);

                if ((e.Row.RowState & DataControlRowState.Edit) > 0) //Estamos en estado de edición
                {
                    
                }
            }
        }

        protected void grvListado_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Actualizar
            //Armar instancia
            MesaE mesa = new MesaE();
            //BoundField 
            //comp.idCompra = Convert.ToInt16(((TextBox)grvListado.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
            mesa.ID = grvListado.Rows[e.RowIndex].Cells[1].Text;
            //TemplateField
            mesa.DESCRIPCION = ((TextBox)grvListado.Rows[e.RowIndex].FindControl("txtDescEdit")).Text;
            mesa.ESTADO = Convert.ToInt16(((DropDownList)grvListado.Rows[e.RowIndex].FindControl("ddlEstadoEdit")).SelectedValue);
            mesa.CONDICION = ((TextBox)grvListado.Rows[e.RowIndex].FindControl("txtCondEdit")).Text;
            //Modificar
            MesaL.Modificar(mesa);
            //Refrescar el GridView
            grvListado.EditIndex = -1;
            refrescarListar();
        }
    }
}