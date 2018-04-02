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
    public class DetalleComandaL
    {

        public void Insertar(DetalleComandaE det)
        {
            try
            {
                new DetalleComandaD().Insertar(det);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }

       
        public List<DetalleComandaE> SeleccionarDetalleComanda(string comanda)
        {

            try
            {
                List<DetalleComandaE> lista = new List<DetalleComandaE>();
                DataSet ds = new DetalleComandaD().SeleccionarDetalleComanda(comanda);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    DetalleComandaE det = new DetalleComandaE();
                    det.IDCOMANDA = fila["IDCOMANDA"].ToString();
                    det.IDPRODUCTO = Convert.ToInt32(fila["IDPRODUCTO"].ToString());
                    det.NOMBREPRODUCTO = fila["NOMBREPRODUCTO"].ToString();
                    det.CANTIDAD = Convert.ToInt32(fila["CANTIDAD"].ToString());
                    det.NOTAS = fila["NOTAS"].ToString();
                    det.SUBTOTAL = Convert.ToDecimal(fila["SUBTOTAL"].ToString());
                    lista.Add(det);
                }
                return lista;
            }
            catch (Exception)
            {

                throw;
            }
        }



    }

    




}
