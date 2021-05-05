import 'package:asynji_sdk/src/storage/types/room.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';

class RoomController {
  final box = Hive.box<Room>(roomStorageBox);

  Future addNewRoom(Room newRoom) async {
    await box.add(newRoom);
  }

  List<Room> getAllRooms() {
    return box.values.toList();
  }

  List<String> getAllIdsOfRooms() {
    return box.values.map((Room r) => r.id).toList();
  }

  Room? getOneRoom(int index) {
    return box.getAt(index);
  }

  Future modifyRoom(int index, updatedRoom) async {
    await box.putAt(index, updatedRoom);
  }

  Future getListenable(
      {required Widget Function(BuildContext, Box<Room>, Widget?) builder,
      Widget? child,
      Key? key}) async {
    return ValueListenableBuilder(
        key: key,
        valueListenable: box.listenable(),
        builder: builder,
        child: child);
  }
}
