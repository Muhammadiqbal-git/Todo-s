import 'dart:io';

String readJson(String name){
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    print(dir);
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/$name').readAsStringSync();
}