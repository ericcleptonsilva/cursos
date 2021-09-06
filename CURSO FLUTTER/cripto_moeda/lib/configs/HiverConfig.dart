import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiverConfig {
  static start() async {
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
  }
}
