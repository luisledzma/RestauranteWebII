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
    public class ProductoL
    {
        public static void Nuevo(ProductoE producto)
        {
            try
            {
                ProductoD.Insertar(producto);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static List<ProductoE> ObtenerPorCategoria(string cate)
        {
            try
            {
                List<ProductoE> lista = new List<ProductoE>();
                DataSet ds = ProductoD.SeleccionarProducto(cate);

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    ProductoE producto = new ProductoE();
                    producto.ID = Convert.ToInt16( fila["ID"]);
                    producto.NOMBRE = fila["NOMBRE"].ToString();
                    producto.DESCRIPCION = fila["DESCRIPCION"].ToString();
                    producto.PRECIO = Convert.ToInt16(fila["PRECIO"]);
                    producto.CATEGORIA = fila["CATEGORIA"].ToString();
                    producto.ESTADO = Convert.ToInt16(fila["ESTADO"]);

                    lista.Add(producto);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static List<ProductoE> ObtenerTodos()
        {
            try
            {
                List<ProductoE> lista = new List<ProductoE>();
                DataSet ds = ProductoD.SeleccionarTodos();

                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    ProductoE producto = new ProductoE();
                    producto.ID = Convert.ToInt16(fila["ID"]);
                    producto.NOMBRE = fila["NOMBRE"].ToString();
                    producto.DESCRIPCION = fila["DESCRIPCION"].ToString();
                    producto.PRECIO = Convert.ToInt16(fila["PRECIO"]);
                    producto.CATEGORIA = fila["CATEGORIA"].ToString();
                    producto.ESTADO = Convert.ToInt16(fila["ESTADO"]);

                    lista.Add(producto);
                }
                return lista;
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
                ProductoD.Modificar(producto);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


        public ProductoE ObtenerProductoPorID(int prod)
        {
            try
            {
                DataSet ds = ProductoD.SeleccionarProductoPorID(prod);
                ProductoE producto = new ProductoE();
                foreach (DataRow fila in ds.Tables[0].Rows)
                {
                    
                    producto.ID = Convert.ToInt16(fila["ID"]);
                    producto.NOMBRE = fila["NOMBRE"].ToString();
                    producto.DESCRIPCION = fila["DESCRIPCION"].ToString();
                    producto.PRECIO = Convert.ToInt16(fila["PRECIO"]);
                    producto.CATEGORIA = fila["CATEGORIA"].ToString();
                    producto.ESTADO = Convert.ToInt16(fila["ESTADO"]);
                    
                }
                return producto;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



    }
}
