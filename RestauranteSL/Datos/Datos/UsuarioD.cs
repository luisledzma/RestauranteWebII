using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Datos
{
    public class UsuarioD
    {


        public DataSet SeleccionarTodos(UsuarioE usuario)
        {

            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_SELECCIONAR_USUARIO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@P_IDENTIFICACION", usuario.IDENTIFICACION);
                comando.Parameters.AddWithValue("@P_CONTRASENNA", usuario.CONTRASENNA);
                DataSet ds = db.ExecuteReader(comando, "TBL_USUARIO");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
           
        }
    }
}
