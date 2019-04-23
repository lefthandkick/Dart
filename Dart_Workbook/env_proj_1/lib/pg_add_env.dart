
import 'dart:async';
import 'package:postgres/postgres.dart';

Future connectDB_Update_Env(Map<String, dynamic> _env_map ) async {

  PostgreSQLConnection connection = await PostgreSQLConnection("127.0.0.1", 5492,
                   "os_env", username: "postgres", password: "mer7677");
  
  await connection.open();
  await connection.query("DELETE FROM macos");

   await _env_map.forEach( (evar, val) {
    // print("${evar} ${val}");
    connection.query("INSERT INTO macos(path, envar) VALUES ('${evar}', '${val}') ");
  });
  // getting errors
  // await connection.close();
}
