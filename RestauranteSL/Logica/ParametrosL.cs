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
    public class ParametrosL
    {

        public ParametrosE SeleccionarConsecutivo(string parametro)
        {
            try
            {
                ParametrosE param = new ParametrosE();
                DataSet ds = new ParametrosD().SeleccionarParametro(parametro);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    param.PARAMETRO = fila["PARAMETRO"].ToString();
                    param.CONSECUTIVO = fila["CONSECUTIVO"].ToString();
                }
                return param;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



        public void Modificar(ParametrosE param)
        {
            try
            {
                ParametrosD.Modificar(param);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }




        public string CalcularConsecutivo(ParametrosE parametro)
        {
            try
            {
                string param = parametro.PARAMETRO;
                string consec = parametro.CONSECUTIVO;
                string miConsecutivo = "";
                
                string[] num = consec.Split('-');
                int numero = Convert.ToInt32(num[1]);
                numero++;
                miConsecutivo = num[0] +"-"+ numero;
                
                return miConsecutivo;

            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

            
        }

    }
}
