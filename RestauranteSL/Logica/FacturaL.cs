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

        public static List<FacturaE> ObtenerFacturaPorFechas(string fechaInicial, string fechaFinal)
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                DataSet ds = FacturaD.SeleccionarFacturaPorFechas(fechaInicial, fechaFinal);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaE fact = new FacturaE();
                    fact.ID = fila["ID"].ToString();
                    fact.IDMESERO = fila["IDMESERO"].ToString();
                    fact.IDMESA = fila["IDMESA"].ToString();
                    fact.IDCOMANDA = fila["IDCOMANDA"].ToString();
                    fact.FECHA = fila["FECHA"].ToString();
                    fact.CLIENTE = fila["CLIENTE"].ToString();
                    fact.TIPOPAGO = fila["TIPOPAGO"].ToString();
                    fact.TOTAL = Convert.ToDecimal(fila["TOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static List<FacturaE> ObtenerFacturaPorFecha(string fechaInicial)
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                DataSet ds = FacturaD.SeleccionarFacturaPorFecha(fechaInicial);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaE fact = new FacturaE();
                    fact.ID = fila["ID"].ToString();
                    fact.IDMESERO = fila["IDMESERO"].ToString();
                    fact.IDMESA = fila["IDMESA"].ToString();
                    fact.IDCOMANDA = fila["IDCOMANDA"].ToString();
                    fact.FECHA = fila["FECHA"].ToString();
                    fact.CLIENTE = fila["CLIENTE"].ToString();
                    fact.TIPOPAGO = fila["TIPOPAGO"].ToString();
                    fact.TOTAL = Convert.ToDecimal(fila["TOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static List<FacturaE> ObtenerFacturas()
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                DataSet ds = FacturaD.SeleccionarTodas();

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaE fact = new FacturaE();
                    fact.ID = fila["ID"].ToString();
                    fact.IDMESERO = fila["IDMESERO"].ToString();
                    fact.IDMESA = fila["IDMESA"].ToString();
                    fact.IDCOMANDA = fila["IDCOMANDA"].ToString();
                    fact.FECHA = fila["FECHA"].ToString();
                    fact.CLIENTE = fila["CLIENTE"].ToString();
                    fact.TIPOPAGO = fila["TIPOPAGO"].ToString();
                    fact.TOTAL = Convert.ToDecimal(fila["TOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



        public static List<FacturaE> ObtenerFacturaPorFechasYMedioPago(string fechaInicial, string fechaFinal,string medioPago)
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                DataSet ds = FacturaD.SeleccionarFacturaPorFechasYMedioPago(fechaInicial, fechaFinal,medioPago);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaE fact = new FacturaE();
                    fact.ID = fila["ID"].ToString();
                    fact.IDMESERO = fila["IDMESERO"].ToString();
                    fact.IDMESA = fila["IDMESA"].ToString();
                    fact.IDCOMANDA = fila["IDCOMANDA"].ToString();
                    fact.FECHA = fila["FECHA"].ToString();
                    fact.CLIENTE = fila["CLIENTE"].ToString();
                    fact.TIPOPAGO = fila["TIPOPAGO"].ToString();
                    fact.TOTAL = Convert.ToDecimal(fila["TOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



        public static List<FacturaE> ObtenerFacturaPorFechasYVarios(string fechaInicial, string fechaFinal, string valor,string parametro)
        {
            try
            {
                List<FacturaE> lista = new List<FacturaE>();
                DataSet ds = FacturaD.SeleccionarFacturaPorFechasYVarios(fechaInicial, fechaFinal, valor,parametro);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    FacturaE fact = new FacturaE();
                    fact.ID = fila["ID"].ToString();
                    fact.IDMESERO = fila["IDMESERO"].ToString();
                    fact.IDMESA = fila["IDMESA"].ToString();
                    fact.IDCOMANDA = fila["IDCOMANDA"].ToString();
                    fact.FECHA = fila["FECHA"].ToString();
                    fact.CLIENTE = fila["CLIENTE"].ToString();
                    fact.TIPOPAGO = fila["TIPOPAGO"].ToString();
                    fact.TOTAL = Convert.ToDecimal(fila["TOTAL"]);

                    lista.Add(fact);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


    }
}
