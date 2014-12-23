using System.Reflection;
using ConfigR;

public class Startup {
   public Startup() {
      Config.Global.LoadScriptFile(Path.Combine(Environment.CurrentDirectory, "Config\\ProjectConfiguration.csx"));
   }
}
