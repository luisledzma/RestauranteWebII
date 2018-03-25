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
    public class UsuarioD
    {


        public DataSet SeleccionarTodos(UsuarioE usuario)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_SELECCIONAR_USUARIO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@P_IDENTIFICACION", usuario.IDENTIFICACION);
                comando.Parameters.AddWithValue("@P_CONTRASENNA", usuario.CONTRASENNA);
                DataSet ds = db.ExecuteReader(comando, "TBL_USUARIO");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
           
        }

        public static DataSet SeleccionarPorId(string id)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_SELECCIONAR_USER_ID");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@IDENTIFICACION", id);
                DataSet ds = db.ExecuteReader(comando, "TBL_USUARIO");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

        public static void Insertar(UsuarioE user)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_SEG_Insertar_Usuario");
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@id", user.IDENTIFICACION);
                comando.Parameters.AddWithValue("@nombre", user.NOMBRE);
                comando.Parameters.AddWithValue("@apellidos", user.APELLIDOS);
                comando.Parameters.AddWithValue("@telefono", user.TELEFONO);
                comando.Parameters.AddWithValue("@correo", user.CORREO_ELECTRONICO);
                comando.Parameters.AddWithValue("@contra", user.CONTRASENNA);
                comando.Parameters.AddWithValue("@perfil", user.FK_PERFIL);
                comando.Parameters.AddWithValue("@estado", user.ESTADO);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }

        public static DataSet SeleccionarUsuarios()
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_SELECCIONAR_TODOS");
                comando.CommandType = CommandType.StoredProcedure;
                DataSet ds = db.ExecuteReader(comando, "TBL_USUARIO");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }

        public static void Modificar(UsuarioE user)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SEG_MODIFICAR_USUARIO");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@IDENTIFICACION", user.IDENTIFICACION);
                comando.Parameters.AddWithValue("@ESTADO", user.ESTADO);

                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            
        }
    }
}
