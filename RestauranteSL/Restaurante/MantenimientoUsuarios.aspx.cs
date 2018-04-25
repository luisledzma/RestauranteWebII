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
            try
            {
                if (!IsPostBack)
                {
                    ddlEstado.SelectedIndex = 0;
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
                UsuarioE usuario = new UsuarioE();

                usuario.IDENTIFICACION = txtId.Text;
                usuario.NOMBRE = txtNombre.Text;
                usuario.APELLIDOS = txtApellido.Text;
                usuario.TELEFONO = txtTelefono.Text;
                usuario.CORREO_ELECTRONICO = txtEmail.Text;
                usuario.CONTRASENNA = txtContra.Text;
                usuario.FK_PERFIL = Convert.ToInt16(ddlPerfil.SelectedValue); ;
                usuario.ESTADO = Convert.ToInt16(ddlEstado.SelectedValue);

                UsuarioL.Nuevo(usuario);
                Response.Redirect("MantenimientoUsuarios.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMantUsuarios", "$('#myModal').modal();", true);
                return;
            }
            
        }

        private void refrescarListar()
        {
            try
            {
                List<UsuarioE> lista = new List<UsuarioE>();
                lista = UsuarioL.ObtenerTodos();
                grvListado.DataSource = lista;
                grvListado.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMantUsuarios", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                    grvListado.EditIndex = e.NewEditIndex;
                    refrescarListar();
               
                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMantUsuarios", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void grvListado_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                grvListado.EditIndex = -1;
                refrescarListar();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMantUsuarios", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void grvListado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //Verificando es que sea una fila de datos
                {
                    //Buscar los controles
                    DropDownList ddlUserEdit = (e.Row.FindControl("ddlEstadoEdit") as DropDownList);

                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMantUsuarios", "$('#myModal').modal();", true);
                return;
            }
            
        }

        protected void grvListado_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                //Actualizar
                //Armar instancia
                UsuarioE user = new UsuarioE();
                //BoundField 
                //comp.idCompra = Convert.ToInt16(((TextBox)grvListado.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
                user.IDENTIFICACION = grvListado.Rows[e.RowIndex].Cells[0].Text;
                //TemplateField
                user.ESTADO = Convert.ToInt16(((DropDownList)grvListado.Rows[e.RowIndex].FindControl("ddlEstadoEdit")).SelectedValue);

                //Modificar
                UsuarioL.Modificar(user);
                //Refrescar el GridView
                grvListado.EditIndex = -1;
                refrescarListar();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMantUsuarios", "$('#myModal').modal();", true);
                return;
            }


        }
    }
}