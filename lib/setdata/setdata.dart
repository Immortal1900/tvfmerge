import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';
String randomfilenames;
File flname;
class settitle{
  static String post_title;
  settitle(String s){
    post_title=s;
  }
}
class setauthor{
  static String author;
  setauthor(String s){
    author=s;
  }
}
class setdesc {
  static String desc;
  setdesc(String s){
    desc=s;
    writeCounter();

  }
  Future writeCounter() async {
    print("write counter CALEED");
    final file = await flname;
     file.writeAsString(desc);
  }
}