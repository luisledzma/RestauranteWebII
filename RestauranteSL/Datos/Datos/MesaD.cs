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
    public class MesaD
    {
        public static void Insertar(MesaE mesa)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("SP_SEG_INSERTAR_MESA");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@ID", mesa.ID);
            comando.Parameters.AddWithValue("@DESCRIPCION", mesa.DESCRIPCION);
            comando.Parameters.AddWithValue("@ESTADO", mesa.ESTADO);
            comando.Parameters.AddWithValue("@CONDICION", mesa.CONDICION);
            db.ExecuteNonQuery(comando);
        }

        public static DataSet SeleccionarTodas()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("SP_SELECCIONAR_TODAS_MESAS ");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "TBL_MESA");
            return ds;
        }

        public static void Modificar(MesaE mesa)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("SP_SEG_MODIFICAR_MESA");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@ID", mesa.ID);
            comando.Parameters.AddWithValue("@DESCRIPCION", mesa.DESCRIPCION);
            comando.Parameters.AddWithValue("@ESTADO", mesa.ESTADO);
            comando.Parameters.AddWithValue("@CONDICION", mesa.CONDICION);

            db.ExecuteNonQuery(comando);
        }
    }
}
