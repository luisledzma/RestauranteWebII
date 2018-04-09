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
    public class FacturaLineaL
    {

        public void InsertarFacturaLinea(FacturaLineaE facL)
        {
            try
            {
                new FacturaLineaD().InsertarFacturaLinea(facL);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public static List<FacturaLineaE> ObtenerTodos()
        {
            try
            {
                List<FacturaLineaE> lista = new List<FacturaLineaE>();
                DataSet ds = FacturaLineaD.SeleccionarTodos();

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaLineaE fact = new FacturaLineaE();
                    fact.IDFACTURA = fila["IDFACTURA"].ToString();
                    fact.IDPRODUCTO = Convert.ToInt16(fila["IDPRODUCTO"]);
                    fact.NOMBREPRODUCTO = fila["NOMBREPRODUCTO"].ToString();
                    fact.CANTIDAD = Convert.ToInt16(fila["CANTIDAD"]);
                    fact.NOTAS = fila["NOTAS"].ToString();
                    fact.IMPUESTOVENTAS = Convert.ToInt16(fila["IMPUESTOVENTAS"]);
                    fact.SERVICIO = Convert.ToDecimal(fila["SERVICIO"]);
                    fact.SUBTOTAL = Convert.ToInt16(fila["SUBTOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }


        }



        public static List<FacturaLineaE> SeleccionarFLPorProductoYFecha(string fechaInicial, string fechaFinal,string producto)
        {
            try
            {
                List<FacturaLineaE> lista = new List<FacturaLineaE>();
                DataSet ds = FacturaLineaD.SeleccionarFLporProdYFecha(fechaInicial,fechaFinal,producto);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaLineaE fact = new FacturaLineaE();
                    fact.IDFACTURA = fila["IDFACTURA"].ToString();
                    fact.IDPRODUCTO = Convert.ToInt16(fila["IDPRODUCTO"]);
                    fact.NOMBREPRODUCTO = fila["NOMBREPRODUCTO"].ToString();
                    fact.CANTIDAD = Convert.ToInt16(fila["CANTIDAD"]);
                    fact.NOTAS = fila["NOTAS"].ToString();
                    fact.IMPUESTOVENTAS = Convert.ToInt16(fila["IMPUESTOVENTAS"]);
                    fact.SERVICIO = Convert.ToDecimal(fila["SERVICIO"]);
                    fact.SUBTOTAL = Convert.ToInt16(fila["SUBTOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }


        }

    }
}
