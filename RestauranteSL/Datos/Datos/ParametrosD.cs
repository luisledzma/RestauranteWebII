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
    public class ParametrosD
    {


        public DataSet SeleccionarParametro(string parametro)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_PAR_SELECCIONAR_PARAMETRO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@P_PARAMETRO", parametro);
                DataSet ds = db.ExecuteReader(comando, "TBL_PARAMETROS");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



        public static void Modificar(ParametrosE param)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_PAR_MODIFICAR_CONSECUTIVO_PARAM");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@PARAMETRO", param.PARAMETRO);
                comando.Parameters.AddWithValue("@CONSECUTIVO", param.CONSECUTIVO);

                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

    }
}
