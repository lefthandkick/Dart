
import 'dart:io';

// mixin
class OS_Env_Path {
  List<String>         _env_paths = List<String>(); 
  Map<String, dynamic> _env_vars  = Map<String, dynamic>(); 

  Map<String, dynamic> _platform_env  = Platform.environment;

  // put env vars and path into individual map and list
  // also use as a constructor..kinda.  The can call this fn in their
  // constructor 
  void _parseEnv() {
    this._platform_env.forEach( (env, val) {
    
          if (env == 'PATH') {
            val.toString().split(":").forEach( (path_val) =>
              this._env_paths.add(path_val)
            );
          } else {
              this._env_vars[env] = val;
          };
     });
  }

  Map<String, dynamic> getEnv() {
    return _env_vars;
  }

  String toStringEnv() {
    String _tostring = '';
    if(this._env_vars.isEmpty) return 'Environment Obj is Empty: Run _parseEnv() \n';
    
    _env_vars.forEach( (item, value) {
      _tostring += '${item} -> ${value} \n';
    });
    _tostring += '\n';

    return _tostring;
  }
  
  String toStringPath() {
    String _tostring = '';
    if(this._env_paths.isEmpty) return 'Path Obj is Empty: Run _parseEnv() \n';

    _env_paths.forEach( (item) {
      _tostring += '${item} \n';
    });
    _tostring += '\n';

    return _tostring;
  }

  String toString() {
    String _tostring = '';
    _tostring += this.toStringEnv();
    _tostring += this.toStringPath();
    return _tostring; 
  }
}


class OS_Platform with OS_Env_Path {
  Map<String, dynamic> _env_os    = Map<String, dynamic>(); 
  
  OS_Platform() {
   this._env_os['Timestamp']      = DateTime.now();
   this._env_os['OS']             = Platform.operatingSystem;
   this._env_os['OS_Ver']         = Platform.operatingSystemVersion;
   this._env_os['Dart_Ver']       = Platform.version;
   this._env_os['Exec_Path']      = Platform.executable;
   this._env_os['Exec_Res_Path']  = Platform.resolvedExecutable;
   this._env_os['Exec_Flags']     = Platform.executableArguments;
   this._env_os['Local_Name']     = Platform.localeName;
   this._env_os['Path_Separator'] = Platform.pathSeparator;
   this._env_os['URI Script']     = Platform.script;
   
   this._parseEnv();
  }

  @override
  String toString({String option = 'None'}) {
    String _tostring = '';

    if(option == 'ENV_PATH' ) 
      _tostring += super.toString();
    else if (option == 'PATH') 
      _tostring += super.toStringPath();
    else if(option == 'ENV')
      _tostring += super.toStringEnv();
    else if(option == 'OS') {
      _env_os.forEach( (item, value) {
        _tostring += '${item} -> ${value} \n';
      });
    }else{
      _tostring = 'toString() Options: ENV_PATH / PATH / ENV / OS';
    }
    return _tostring;
  }
}
