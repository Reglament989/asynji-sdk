import "package:asynji_sdk/src/base/controllers/auth_controller.dart";
import "package:asynji_sdk/src/constants.dart";
import 'package:asynji_sdk/src/db/types/room_model.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import "package:hive/hive.dart";
import 'package:hive_flutter/hive_flutter.dart';

class RoomController extends AuthController {
  Box<Room>? roomBox;
  @override
  Future<void> init() async {
    roomBox = await Hive.openBox<Room>(Constants.auth_controller_box);
    await super.init();
  }

  Future<void> addNewRoom() async {}

  // Future

  Room? getRoom(String id) {
    return roomBox!.get(id);
  }

  @override
  Future<void> save() {
    // TODO: implement save
    throw UnimplementedError();
  }

  ValueListenable<Box<Room>> listenable() {
    return roomBox!.listenable();
  }
}
