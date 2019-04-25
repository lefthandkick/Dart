
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
import 'dart:async';
import 'package:env_proj/os_platform.dart';
import 'package:env_proj/pg_env.dart';

Future main(List<String> arguments) async {
  print(" ---- The Start ----");
  
  // OS_Platform  = OS_Platform();
  // connectDB_Update_Env(macbook_1);

  MyOS_Platform myMBP = MyOS_Platform();
  //print(myMBP.toString() );

  //add to postgress
  MyOSDatabase myMBPdb = MyOSDatabase(sysName: 'zaatas',  dbName: 'os_env', 
                                       action: 'insert', platformInfo: myMBP.init_values);
  
  print(' ---- The End ----');
}






