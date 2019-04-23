
// Excersize: 
// -------------------------------------------------------
/*
Create a Class and Mixin that together:
- get the Platform Proporties
- used Mixin in as a super class for access to it's methods and vars
- use Mixin method as a constuctor by the Class using (with)
- overide toString() to facilitate various output
- populate a postgres db with environment variables

Next Exersize will add method to compare instances for any
changes in Platform info.  Aka, what has changed?
*/
import 'package:env_proj/os_platform.dart';
import 'package:env_proj/pg_add_env.dart';


main(List<String> arguments) {
  print(" ---- The Start ----");
  
  OS_Platform startEnv = OS_Platform();

  Map<String, dynamic> enVars = startEnv.getEnv();

  connectDB_Update_Env(enVars);

  print(" ---- The End ----");

  // print(startEnv.toString(option: 'OS') );
  // print(startEnv.toString(option: 'ENV_PATH') );
  // print(startEnv.toString(option: 'ENV') );
  // print(startEnv.toString(option: 'PATH') );
}







