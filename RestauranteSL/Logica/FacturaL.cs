using Datos.Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class FacturaL
    {

        public void InsertarFactura(FacturaE factura)
        {
            try
            {
                new FacturaD().InsertarFactura(factura);
            }
            catch (Exception ex)
            {

                throw;
            }
        }



    }
}
