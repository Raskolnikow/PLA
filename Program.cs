using System;
using System.IO;
using Microsoft.AspNetCore.Hosting;


namespace Pla
{
    public class Program
    {
        public static void Main(string[] args)
        {
          var host = new WebHostBuilder()
              .UseKestrel()
//              .UseUrls("http://192.168.178.5050")
              .UseContentRoot(Directory.GetCurrentDirectory())
              .UseIISIntegration()
              .UseStartup<Startup>()
              .Build();

          host.Run();
        }
    }
}
