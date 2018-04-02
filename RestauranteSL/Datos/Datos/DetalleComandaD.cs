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
    public class DetalleComandaD
    {

        public void Insertar(DetalleComandaE det)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_SEG_INSERTAR_DET_COMANDA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@IDCOMANDA", det.IDCOMANDA);
                comando.Parameters.AddWithValue("@IDPRODUCTO", det.IDPRODUCTO);
                comando.Parameters.AddWithValue("@NOMBREPRODUCTO", det.NOMBREPRODUCTO);
                comando.Parameters.AddWithValue("@CANTIDAD", det.CANTIDAD);
                comando.Parameters.AddWithValue("@NOTAS", det.NOTAS);
                comando.Parameters.AddWithValue("@SUBTOTAL", det.SUBTOTAL);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


        public DataSet SeleccionarDetalleComanda(string comanda)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SELECCIONAR_DETALLE_COMANDA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@P_COMANDA", comanda);
                DataSet ds = db.ExecuteReader(comando, "TBL_DETALLE_COMANDA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



    }
}
