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
    public partial class Login : System.Web.UI.Page
    {
        private UsuarioL logica = new UsuarioL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                if(txtUsuario.Text == "" || txtContrasena.Text == "")
                {
                    lblAlert.Text = "Debe digitar una Identificación y una Contraseña.";
                    errorMsj.Attributes.Add("style", "display:block;");
                    return;
                }


                UsuarioE user = new UsuarioE();
                bool existe = false;
                user.IDENTIFICACION = txtUsuario.Text;
                user.CONTRASENNA = new FuncionesL().Encrypt(txtContrasena.Text);
                UsuarioE miUsuario = logica.SeleccionarUsuario(user);



                if (miUsuario.IDENTIFICACION != null && miUsuario.CONTRASENNA != null)
                {
                    existe = true;
                }

                if (existe)
                {
                    Session["Login"] = miUsuario;
                    Response.Redirect("Principal.aspx");
                }
                else
                {
                    lblAlert.Text = "Debe digitar una Identificación y una Contraseña válida.";
                    errorMsj.Attributes.Add("style", "display:block;");
                    return;
                }
                
                 
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: "+ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                return;
            }
        }
    }
}