using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class FuncionesL
    {
        
        public bool validarTarjeta(string numTarjeta)
        {
            if (string.IsNullOrEmpty(numTarjeta))
            {
                return false;
            }
            
            int sumaDeDigitos = numTarjeta.Where((e) => e >= '0' && e <= '9').Reverse()
                .Select((e, i) => ((int)e - 48) * (i % 2 == 0 ? 1 : 2))
                .Sum((e) => e / 10 + e % 10);

            return sumaDeDigitos % 10 == 0;

        }

        //#region Encriptar


        //public string Encrypt(string text)

        //{

        //    return Encriptar(text,"progra_project", "s@lAvz", "MD5", 1, "@1B2c3D4e5F6g7H8", 128);

        //}



        //private string Encriptar(string textoQueEncriptaremos,string passBase, string saltValue, string hashAlgorithm,int passwordIterations, string initVector, int keySize)

        //{

        //    byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);

        //    byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

        //    byte[] plainTextBytes = Encoding.UTF8.GetBytes(textoQueEncriptaremos);

        //    PasswordDeriveBytes password = new PasswordDeriveBytes(passBase,saltValueBytes, hashAlgorithm, passwordIterations);

        //    byte[] keyBytes = password.GetBytes(keySize / 8);

        //    RijndaelManaged symmetricKey = new RijndaelManaged()
        //    {

        //        Mode = CipherMode.CBC
        //    };

        //    ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes,initVectorBytes);

        //    MemoryStream memoryStream = new MemoryStream();

        //    CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor,CryptoStreamMode.Write);

        //    cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

        //    cryptoStream.FlushFinalBlock();

        //    byte[] cipherTextBytes = memoryStream.ToArray();

        //    memoryStream.Close();

        //    cryptoStream.Close();

        //    string cipherText = Convert.ToBase64String(cipherTextBytes);

        //    return cipherText;

        //}

        //#endregion

    }
}
