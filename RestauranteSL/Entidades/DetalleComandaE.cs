using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleComandaE
    {
        public string IDCOMANDA { get; set; }

        public int IDPRODUCTO { get; set; }

        public string NOMBREPRODUCTO { get; set; }

        public int CANTIDAD { get; set; }

        public string NOTAS { get; set; }
        
        public decimal SUBTOTAL { get; set; }
    }
}
