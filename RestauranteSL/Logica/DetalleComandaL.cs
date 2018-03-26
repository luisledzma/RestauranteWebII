using Datos.Datos;
using Entidades;
using System;
using System.Collections.Generic;
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

    }
}
