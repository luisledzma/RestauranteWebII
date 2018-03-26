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
    public class ProductoD
    {
        public static DataSet SeleccionarProducto(string cate)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_SELECCIONAR_CATEGORIA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@CATEGORIA", cate);
                DataSet ds = db.ExecuteReader(comando, "TBL_PRODUCTO");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static void Insertar(ProductoE producto)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_SEG_INSERTAR_PRODUCTO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@NOMBRE", producto.NOMBRE);
                comando.Parameters.AddWithValue("@DESCRIPCION", producto.DESCRIPCION);
                comando.Parameters.AddWithValue("@PRECIO", producto.PRECIO);
                comando.Parameters.AddWithValue("@CATEGORIA", producto.CATEGORIA);
                comando.Parameters.AddWithValue("@ESTADO", producto.ESTADO);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static DataSet SeleccionarTodos()
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_SELECCIONAR_PRODUCTOS");
                comando.CommandType = CommandType.StoredProcedure;
                DataSet ds = db.ExecuteReader(comando, "TBL_PRODUCTOS");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static void Modificar(ProductoE producto)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_MODIFICAR_PRODUCTO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", producto.ID);
                comando.Parameters.AddWithValue("@ESTADO", producto.ESTADO);
                comando.Parameters.AddWithValue("@DESCRIPCION", producto.DESCRIPCION);
                comando.Parameters.AddWithValue("@PRECIO", producto.PRECIO);

                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



        public static DataSet SeleccionarProductoPorID(int prod)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_PROD_SELECCIONAR_PRODUCTO_POR_ID");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", prod);
                DataSet ds = db.ExecuteReader(comando, "TBL_PRODUCTO");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



    }
}
