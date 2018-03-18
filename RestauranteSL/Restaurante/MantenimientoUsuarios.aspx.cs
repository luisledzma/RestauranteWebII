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
    public partial class MantenimientoUsuarios : System.Web.UI.Page
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
            UsuarioE usuario = new UsuarioE();

            usuario.IDENTIFICACION = txtId.Text;
            usuario.NOMBRE = txtNombre.Text;
            usuario.APELLIDOS = txtApellido.Text;
            usuario.TELEFONO = txtTelefono.Text;
            usuario.CORREO_ELECTRONICO = txtEmail.Text;
            usuario.CONTRASENNA = txtContra.Text;
            usuario.FK_PERFIL = 0;
            usuario.ESTADO = Convert.ToInt16( ddlEstado.SelectedValue);

            UsuarioL.Nuevo(usuario);
            Response.Redirect("MantenimientoUsuarios.aspx");
        }

        private void refrescarListar()
        {
            List<UsuarioE> lista = new List<UsuarioE>();
            lista = UsuarioL.ObtenerTodos();
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
                DropDownList ddlUserEdit = (e.Row.FindControl("ddlEstadoEdit") as DropDownList);
                
            }
        }

        protected void grvListado_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Actualizar
            //Armar instancia
            UsuarioE user = new UsuarioE();
            //BoundField 
            //comp.idCompra = Convert.ToInt16(((TextBox)grvListado.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
            user.IDENTIFICACION = grvListado.Rows[e.RowIndex].Cells[1].Text;
            //TemplateField
            user.ESTADO = Convert.ToInt16(((DropDownList)grvListado.Rows[e.RowIndex].FindControl("ddlEstadoEdit")).SelectedValue);
            
            //Modificar
            UsuarioL.Modificar(user);
            //Refrescar el GridView
            grvListado.EditIndex = -1;
            refrescarListar();
        }
    }
}