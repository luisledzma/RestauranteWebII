using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class UsuarioE
    {

        public string IDENTIFICACION { get; set; }

        public string NOMBRE { get; set; }

        public string APELLIDOS { get; set; }

        public string TELEFONO { get; set; }

        public string CORREO_ELECTRONICO { get; set; }

        public string CONTRASENNA { get; set; }

        public int FK_PERFIL { get; set; }

        public int ESTADO { get; set; }

    }
}
