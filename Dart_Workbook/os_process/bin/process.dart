import 'dart:io';

main(List<String> arguments) {

  //List all files in a directory - mac or linux  

  Process.run('ls', ['-lah']).then((ProcessResult results) {
    print(results.stdout);
    print('Exit code: ${results.exitCode}'); // 0 is good
  });
}