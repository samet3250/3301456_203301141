import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PathProviderStorage {
  Future<String> _localPath() async {
    var directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile() async {
    var file = File(await _localPath() + 'info.txt');
    return file;
  }

  Future<String> read() async {
    try {
      File file = await _localFile();
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "User";
    }
  }

  Future<File> write(String value) async {
    File file = await _localFile();
    return file.writeAsString('$value');
  }
}
