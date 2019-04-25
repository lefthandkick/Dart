
import 'dart:async';
import 'package:postgres/postgres.dart';
// import 'package:env_proj/os_platform.dart';

// wip - create class/obj that can be manage Platform changes, etc.
// Build with postgress and simple file-system

class MyOSDatabase {
  String action  = '';
  String dbName  = '';
  String sysName = '';
  List platformInfo = [];

  // PostgreSQLConnection dbConnection;
  PostgreSQLConnection dbConnection;

  MyOSDatabase(
    { this.action, this.platformInfo, this.dbName, this.sysName }) {

    // add checks
    prepDatabase();

   // action check to .. insert add/purgre/insert... 

    if(this.platformInfo == null) {
      snapShot();
    } else {
      insertShot();
    };
  }
  
  // --------------------------------------------
  void prepDatabase() async {
    // try catch and .then() versions  

    this.dbConnection = await PostgreSQLConnection("127.0.0.1", 5492, '${this.dbName}', username: "postgres", password: "mer7677");
    await this.dbConnection.open();
  }
  
  Future closeDB() {
    return this.dbConnection.close();
  }

  void snapShot() {
    print("snapShot");
  }

void insertShot() {
  String timestamp = this.platformInfo[0];
  Map  envars      = this.platformInfo[1];
  Map  platform    = this.platformInfo[2];
  List paths       = this.platformInfo[3];

  print("----------------");

    this.dbConnection.query("DELETE FROM envar").then( (_) => print('yipeeeee'));
  
  // dbConnection.query("DELETE FROM envrs");

  // envars.forEach( (key,val) async {
  //     await this.dbConnection.query("INSERT INTO envar(timestamp, machine, key, value) VALUES ('${timestamp}', '${this.sysName}', '${key}', '${val}') ");
  // });

}

}

  
