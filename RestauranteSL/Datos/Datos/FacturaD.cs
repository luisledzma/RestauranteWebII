using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Datos
{
    public class FacturaD
    {

        public void InsertarFactura(FacturaE fac)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_FAC_INSERTAR_FACTURA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", fac.ID);
                comando.Parameters.AddWithValue("@IDMESERO", fac.IDMESERO);
                comando.Parameters.AddWithValue("@IDMESA", fac.IDMESA);
                comando.Parameters.AddWithValue("@IDCOMANDA", fac.IDCOMANDA);
                comando.Parameters.AddWithValue("@FECHA", fac.FECHA);
                comando.Parameters.AddWithValue("@CLIENTE", fac.CLIENTE);
                comando.Parameters.AddWithValue("@TIPOPAGO", fac.TIPOPAGO);
                comando.Parameters.AddWithValue("@TOTAL", fac.TOTAL);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static DataSet SeleccionarFacturaPorFechas(string fechaInicial, string fechaFinal)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_FAC_SELECCIONAR_POR_FECHAS");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@FECHAINICIAL", fechaInicial);
                comando.Parameters.AddWithValue("@FECHAFINAL", fechaFinal);
                DataSet ds = db.ExecuteReader(comando, "TBL_FACTURA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static DataSet SeleccionarFacturaPorFechasYMedioPago(string fechaInicial, string fechaFinal,string medioPago)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_FAC_SELECCIONAR_POR_FECHAS_YMEDIO_PAGO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@FECHAINICIAL", fechaInicial);
                comando.Parameters.AddWithValue("@FECHAFINAL", fechaFinal);
                comando.Parameters.AddWithValue("@MEDIOPAGO", medioPago);
                DataSet ds = db.ExecuteReader(comando, "TBL_FACTURA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


        public static DataSet SeleccionarFacturaPorFechasYVarios(string fechaInicial, string fechaFinal, string valor,string parametro)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_FAC_SELECCIONAR_POR_FECHAS_Y_VARIOS");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@FECHAINICIAL", fechaInicial);
                comando.Parameters.AddWithValue("@FECHAFINAL", fechaFinal);
                comando.Parameters.AddWithValue("@VALOR", valor);
                comando.Parameters.AddWithValue("@PARAMETRO", parametro);
                DataSet ds = db.ExecuteReader(comando, "TBL_FACTURA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static DataSet SeleccionarFacturaPorFecha(string fechaInicial)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_FAC_SELECCIONAR_POR_FECHA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@FECHAINICIAL", fechaInicial);
                DataSet ds = db.ExecuteReader(comando, "TBL_FACTURA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


        public static DataSet SeleccionarTodas()
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_FAC_SELECCIONAR_TODAS");
                comando.CommandType = CommandType.StoredProcedure;
                DataSet ds = db.ExecuteReader(comando, "TBL_FACTURA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }
    }
}
