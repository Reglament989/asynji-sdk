import 'package:asynji_sdk/src/api/api_base.dart';
import 'package:asynji_sdk/src/storage/types/global.dart';
import 'package:asynji_sdk/src/storage/types/message.dart';
import 'package:asynji_sdk/src/storage/types/room.dart';
import 'package:asynji_sdk/src/storage/types/user.dart';
import 'package:hive/hive.dart';
import 'package:asynji_sdk/src/storage/controlers/global.controller.dart';
import 'storage/controlers/room.controller.dart';

class Asynji {
  late ApiBase api;

  Asynji() {
    api = ApiBase();
  }

  Future init() async {
    await api.run();
  }
}

void main(List<String> args) {
  Hive.registerAdapter(GlobalAdapter());
  Hive.registerAdapter(MessageAdapter());
  Hive.registerAdapter(RoomAdapter());
  Hive.registerAdapter(UserAdapter());
}
