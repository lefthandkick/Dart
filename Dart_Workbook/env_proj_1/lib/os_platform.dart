
// capture os info for the purpose of adding to 
// postres tables
//
import 'dart:io';


mixin OS_Platform_Tools {
  // methods
  List<dynamic> _snapShot() {

    int time  = 0;
    int env   = 1; 
    int props = 2; 
    int paths = 3; 

    List platformSnapshot = [
      String,                  // timestamp
      Map<String, dynamic>(),  // env
      Map<String, dynamic>(),  // props 
      List<String>()           // paths
    ];

    // time is not part of Platform, will use for key in postgress
    platformSnapshot[time]                    = DateTime.now().toString();

    platformSnapshot[props]['OS']             = Platform.operatingSystem;
    platformSnapshot[props]['OS_Version']     = Platform.operatingSystemVersion;
    platformSnapshot[props]['Dart_Ver']       = Platform.version;
    platformSnapshot[props]['Exec_Path']      = Platform.executable;
    platformSnapshot[props]['Exec_Res_Path']  = Platform.resolvedExecutable;
    platformSnapshot[props]['Exec_Flags']     = Platform.executableArguments;
    platformSnapshot[props]['Local_Name']     = Platform.localeName;
    platformSnapshot[props]['Path_Separator'] = Platform.pathSeparator;
    platformSnapshot[props]['URI Script']     = Platform.script;

    List env_path = _extractEnvPath();
    // is there a way to destructure ?
    platformSnapshot[env]   = env_path[0];
    platformSnapshot[paths] = env_path[1];

    return platformSnapshot;
  }
  
  List _extractEnvPath() {
    List env_path = [
      Map<String, dynamic>(), 
      List<String>()
    ];

    Platform.environment.forEach( (env, val) {
      if (env == 'PATH') {
          val.toString().split(":").forEach( (path_str) =>
          env_path[1].add(path_str));
      } else {
          env_path[0][env] = val;
      };
    });
    return env_path;
  }
}
// end mixin

class MyOS_Platform with OS_Platform_Tools {

  List<dynamic> init_values = List<dynamic>();

  MyOS_Platform() {
    this.init_values = super._snapShot();
  }

  @override
  String toString() {
      String tostring = '';
      // timestamp
      tostring += '\n ------[ ${this.init_values[0]} ]------ \n';

      tostring += '\n ------[ Environment Variables ]------ \n';
      this.init_values[1].forEach( (k1, v1) => tostring += '${k1} -> ${v1} \n' );

      tostring += '\n ------[ Platform Variables ]------ \n';
      this.init_values[2].forEach( (k2, v2 ) => tostring += '${k2} -> ${v2} \n' );
    
      tostring += '\n ------[ \$PATH ]------ \n';
      this.init_values[3].forEach( (v) => tostring += '${v} \n' );

      return tostring; 
    }
  }
