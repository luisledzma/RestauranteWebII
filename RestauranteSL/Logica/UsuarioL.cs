using Datos.Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class UsuarioL
    {
        private UsuarioD datos = new UsuarioD(); 

        public UsuarioE SeleccionarUsuario(UsuarioE usuario)
        {
            try
            {
                DataSet ds = datos.SeleccionarTodos(usuario);
                UsuarioE user = new UsuarioE();
                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    user.IDENTIFICACION = fila["IDENTIFICACION"].ToString();
                    user.NOMBRE = fila["NOMBRE"].ToString();
                    user.APELLIDOS = fila["APELLIDOS"].ToString();
                    user.TELEFONO = fila["TELEFONO"].ToString();
                    user.CORREO_ELECTRONICO = fila["CORREO_ELECTRONICO"].ToString();
                    user.CONTRASENNA = fila["CONTRASENNA"].ToString();
                    user.FK_PERFIL = Convert.ToInt32(fila["FK_PERFIL"].ToString());
                    user.ESTADO = Convert.ToInt32(fila["ESTADO"].ToString());
                }

                return user;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }

        public static void Nuevo(UsuarioE user)
        {
            UsuarioD.Insertar(user);
        }

        public static List<UsuarioE> ObtenerTodos()
        {
            List<UsuarioE> lista = new List<UsuarioE>();
            DataSet ds = UsuarioD.SeleccionarUsuarios();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                UsuarioE users = new UsuarioE();
                users.IDENTIFICACION = fila["IDENTIFICACION"].ToString() ;
                users.NOMBRE = fila["NOMBRE"].ToString();
                users.APELLIDOS = fila["APELLIDOS"].ToString();
                users.TELEFONO = fila["TELEFONO"].ToString();
                users.CORREO_ELECTRONICO = fila["CORREO_ELECTRONICO"].ToString();
                users.CONTRASENNA = fila["CONTRASENNA"].ToString();
                users.FK_PERFIL = Convert.ToInt16( fila["FK_PERFIL"]);
                users.ESTADO = Convert.ToInt16(fila["ESTADO"]);

                lista.Add(users);
            }
            return lista;
        }

        public static void Modificar(UsuarioE user)
        {
            UsuarioD.Modificar(user);
        }

    }
}
