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
    public class FacturaLineaD
    {


        public void InsertarFacturaLinea(FacturaLineaE facL)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_FAC_INSERTAR_FACTURA_LINEA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@IDFACTURA", facL.IDFACTURA);
                comando.Parameters.AddWithValue("@IDPRODUCTO", facL.IDPRODUCTO);
                comando.Parameters.AddWithValue("@NOMBREPRODUCTO", facL.NOMBREPRODUCTO);
                comando.Parameters.AddWithValue("@CANTIDAD", facL.CANTIDAD);
                comando.Parameters.AddWithValue("@NOTAS", facL.NOTAS);
                comando.Parameters.AddWithValue("@IMPUESTOVENTAS", facL.IMPUESTOVENTAS);
                comando.Parameters.AddWithValue("@SERVICIO", facL.SERVICIO);
                comando.Parameters.AddWithValue("@SUBTOTAL", facL.SUBTOTAL);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


    }
}
