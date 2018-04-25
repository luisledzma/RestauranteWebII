using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante
{
    public partial class RST : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["Login"] == null)
                {
                    HttpContext.Current.Response.Redirect("Login.aspx");
                }
                else
                {
                    cargarUsuario();
                    #region privilegios
                    //Si el perfil del Usuario es Gerente
                    if ((Session["Login"] as UsuarioE).FK_PERFIL == 1)
                    {
                        //Menu
                        mantenimientos.Attributes.Add("style", "display:block");
                        reportes.Attributes.Add("style", "display:block");
                        ventas1.Attributes.Add("style", "display:block");
                        ventas2.Attributes.Add("style", "display:block");
                        ventas3.Attributes.Add("style", "display:block");
                        comandas.Attributes.Add("style", "display:block");
                        mesas.Attributes.Add("style", "display:block");

                    }
                    //Si el perfil del Usuario es Mesero
                    if ((Session["Login"] as UsuarioE).FK_PERFIL == 0)
                    {
                        reportes.Attributes.Add("style", "display:block");
                        ventas3.Attributes.Add("style", "display:block");
                        comandas.Attributes.Add("style", "display:block");
                        mesas.Attributes.Add("style", "display:block");
                    }
                    #endregion
                }
                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMaster", "$('#myModal').modal();", true);
                return;
            }
        }



        private void cargarUsuario()
        {
            try
            {
                UsuarioE miUsuario = (Session["Login"] as UsuarioE);
                lblmiPerfil.Text = miUsuario.NOMBRE;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMaster", "$('#myModal').modal();", true);
                return;
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("Login");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalMaster", "$('#myModal').modal();", true);
                return;
            }
        }
    }
}