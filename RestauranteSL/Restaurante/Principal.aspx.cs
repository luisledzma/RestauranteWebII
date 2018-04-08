using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Login"] as UsuarioE).FK_PERFIL == 1)
            {
                //Menu
                mantenim1.Attributes.Add("style", "display:normal");
                mantenim2.Attributes.Add("style", "display:normal");
                mantenim3.Attributes.Add("style", "display:normal");
                vent1.Attributes.Add("style", "display:normal");
                vent2.Attributes.Add("style", "display:normal");
                vent3.Attributes.Add("style", "display:normal");
                comand.Attributes.Add("style", "display:normal");
                comand2.Attributes.Add("style", "display:normal");
            }
            if ((Session["Login"] as UsuarioE).FK_PERFIL == 0)
            {
                vent3.Attributes.Add("style", "display:normal");
                comand.Attributes.Add("style", "display:normal");
                comand2.Attributes.Add("style", "display:normal");
            }
        }
    }
}