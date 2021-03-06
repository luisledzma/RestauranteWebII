﻿using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Datos
{
    public class ComandaD
    {


        public void Insertar(ComandaE com)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_SEG_INSERTAR_COMANDA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", com.ID);
                comando.Parameters.AddWithValue("@NOMBRECLIENTE", com.NOMBRECLIENTE);
                comando.Parameters.AddWithValue("@IDMESERO", com.IDMESERO);
                comando.Parameters.AddWithValue("@IDMESA", com.IDMESA);
                comando.Parameters.AddWithValue("@ESTADO", com.ESTADO);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



        public DataSet SeleccionarComandaPorMesa(string mesa)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("SP_SELECCIONAR_COMANDA_POR_MESA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@P_MESA", mesa);
                DataSet ds = db.ExecuteReader(comando, "TBL_COMANDA");
                return ds;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }


        public void ActualizarEstadoComanda(ComandaE com)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("Default");

                SqlCommand comando = new SqlCommand("SP_SEG_ACTUALIZAR_ESTADO_COMANDA");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", com.ID);
                comando.Parameters.AddWithValue("@ESTADO", com.ESTADO);
                db.ExecuteNonQuery(comando);
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }



    }
}
