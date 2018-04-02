using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class FacturaE
    {

        public string ID { get; set; }

        public string IDMESERO { get; set; }

        public string IDMESA { get; set; }

        public string IDCOMANDA { get; set; }

        public string FECHA { get; set; }

        public string CLIENTE { get; set; }

        public string TIPOPAGO { get; set; }
        
        public decimal TOTAL { get; set; }
    }
}
