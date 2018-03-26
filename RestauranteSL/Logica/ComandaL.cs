using Datos.Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class ComandaL
    {

        public void Insertar(ComandaE com)
        {
            try
            {
                new ComandaD().Insertar(com);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }

    }
}
