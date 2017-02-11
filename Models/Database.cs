using System;
using System.Collections.Generic;
using Microsoft.Data.Sqlite;

namespace Repeater
{
    public class Lerneinheit
    {
        public string Fach { get;set; }
        //public string Oberfach { get; set; }
        public string Gebiet { get; set; }
        public string Thema { get; set; }
        public string Stichwort { get; set; }
        public string Notiz { get; set; }
    }

    public class Database
    {
        string connstring = "Filename=../../../data/db/repeat.db";
        SqliteConnection db = null;

        public Database()
        {
            try
            {
                db = new SqliteConnection(connstring);
                db.Open();
                db.Close();
            }
            catch (System.Exception)
            {      
                throw new System.Exception("Konnte Datenbank nicht öffnen");
            }
        } 

        public int GetNumberOfElements()
        {
            int numelements = 0;

            try
            {
                db.Open();
                
                SqliteCommand cmd = db.CreateCommand();
                cmd.CommandText = "SELECT count(*) FROM v_all";
                var ret = (long)cmd.ExecuteScalar();

                numelements = (int)ret;

                db.Close();
            }
            catch (System.Exception ex)
            {
                Console.WriteLine(ex);
                db.Close();
                throw;
            }

            return numelements;
        }

        public Lerneinheit GetOne(int id)
        {
            Lerneinheit le = null;

            try
            {
                db.Open();
                
                SqliteCommand cmd = db.CreateCommand();
                cmd.CommandText = "SELECT * FROM v_new_e limit 1";
                var ret = cmd.ExecuteReader();

                while (ret.Read())
                {
                    le = new Lerneinheit();

                    le.Fach = ret.GetString(0);
                    //le.Oberfach = ret.GetString(1);
                    le.Gebiet = ret.GetString(2);
                    le.Thema = ret.IsDBNull(3) ? "" : ret.GetString(3);
                    //le.Stichwort = ret.GetString(4);
                    //le.Notiz = ret.GetString(5);
                }

                db.Close();
            }
            catch (System.Exception ex)
            {
                throw;
            }

            return le;
        }

        public List<Lerneinheit> GetLerneinheiten()
        {
            var l = new List<Lerneinheit>();

            try
            {
                db.Open();
                
                SqliteCommand cmd = db.CreateCommand();
                cmd.CommandText = "SELECT * FROM v_new_e";
                var ret = cmd.ExecuteReader();

                while (ret.Read())
                {
                    Lerneinheit le = new Lerneinheit();

                    le.Fach = ret.IsDBNull(0) ? "" : ret.GetString(0);
                    //le.Oberfach = ret.IsDBNull(1) ? "" : ret.GetString(1);
                    le.Gebiet = ret.IsDBNull(2) ? "" : ret.GetString(2);
                    le.Thema = ret.IsDBNull(3) ? "" : ret.GetString(3);
                    le.Stichwort = ret.IsDBNull(4) ? "" : ret.GetString(4);
                    le.Notiz = ret.IsDBNull(5) ? "" : ret.GetString(5);

                    l.Add(le);
                }

                db.Close();
            }
            catch (System.Exception ex)
            {
                
                throw;
            }
            return l;
        }
    }
}
