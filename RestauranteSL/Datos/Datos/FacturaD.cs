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
    public class FacturaD
    {

        public void InsertarFactura(FacturaE fac)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_FAC_INSERTAR_FACTURA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", fac.ID);
                comando.Parameters.AddWithValue("@IDMESERO", fac.IDMESERO);
                comando.Parameters.AddWithValue("@IDMESA", fac.IDMESA);
                comando.Parameters.AddWithValue("@IDCOMANDA", fac.IDCOMANDA);
                comando.Parameters.AddWithValue("@FECHA", fac.FECHA);
                comando.Parameters.AddWithValue("@CLIENTE", fac.CLIENTE);
                comando.Parameters.AddWithValue("@TIPOPAGO", fac.TIPOPAGO);
                comando.Parameters.AddWithValue("@TOTAL", fac.TOTAL);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


    }
}
