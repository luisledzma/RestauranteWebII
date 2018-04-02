using Datos.Datos;
using Entidades;
using System;
using System.Collections.Generic;
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

    }
}
