import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
   _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

    _localFile() async {
    final file = File(await _localPath()+'info.txt');
    return file;
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile();

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "User";
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile();

    // Write the file
    return file.writeAsString('$counter');
  }
}