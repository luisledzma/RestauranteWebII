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
    public class MesaL
    {
        public static void Nuevo(MesaE mesa)
        {
            try
            {
                MesaD.Insertar(mesa);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }

        public static List<MesaE> ObtenerTodos()
        {
            try
            {
                List<MesaE> lista = new List<MesaE>();
                DataSet ds = MesaD.SeleccionarTodas();

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    MesaE mesa = new MesaE();
                    mesa.ID = fila["ID"].ToString();
                    mesa.DESCRIPCION = fila["DESCRIPCION"].ToString();
                    mesa.ESTADO = Convert.ToInt16(fila["ESTADO"]);
                    mesa.CONDICION = fila["CONDICION"].ToString();

                    lista.Add(mesa);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }

        public static void Modificar(MesaE mesa)
        {
            try
            {
                MesaD.Modificar(mesa);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }
    }
}
