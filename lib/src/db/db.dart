import 'package:asynji_sdk/src/db/types/settings_model.dart';
import 'package:asynji_sdk/src/db/types/room_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RoomAdapter());
    Hive.registerAdapter(SettingsAdapter());
  }
}
