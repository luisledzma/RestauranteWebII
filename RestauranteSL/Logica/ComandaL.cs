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



        public ComandaE SeleccionarComandaPorMesa(string mesa)
        {

            try
            {
                ComandaE coman = new ComandaE();
                DataSet ds = new ComandaD().SeleccionarComandaPorMesa(mesa);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    coman.ID = fila["ID"].ToString();
                    coman.NOMBRECLIENTE = fila["NOMBRECLIENTE"].ToString();
                    coman.IDMESERO = fila["IDMESERO"].ToString();
                    coman.IDMESA = fila["IDMESA"].ToString();
                    coman.ESTADO = fila["ESTADO"].ToString();
                }
                return coman;
            }
            catch (Exception)
            {

                throw;
            }
        }


        public void ActualizarEstadoComanda(ComandaE comanda)
        {
            try
            {
                new ComandaD().ActualizarEstadoComanda(comanda);
            }
            catch (Exception)
            {

                throw;
            }
        }



    }
}
