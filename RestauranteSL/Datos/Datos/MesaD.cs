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
            try
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
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }

        public static DataSet SeleccionarTodas()
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SELECCIONAR_TODAS_MESAS");
                comando.CommandType = CommandType.StoredProcedure;
                DataSet ds = db.ExecuteReader(comando, "TBL_MESA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }

        public static void Modificar(MesaE mesa)
        {
            try
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
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }

        public static void ModificarCondicion(string id,string condicion)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_MODIFICAR_COND_MESA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", id);
                comando.Parameters.AddWithValue("@CONDICION", condicion);

                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }

        public static void ModificarEstado(MesaE mesa)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_MODIFICAR_ESTADO_MESA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", mesa.ID);
                comando.Parameters.AddWithValue("@ESTADO", mesa.ESTADO);

                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }
    }
}
