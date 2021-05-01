import 'package:asynji_sdk/src/storage/types/message.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MessagesController {
  late Box<Message> box;

  MessagesController(String roomId) {
    box = Hive.box('Messages-$roomId');
  }

  List<Message> getMessages() {
    return box.values.toList();
  }

  Future modifyMessage(int index, updatedRoom) async {
    await box.putAt(index, updatedRoom);
  }

  Future getListenable(
      {required Widget Function(BuildContext, Box<Message>, Widget?) builder,
      Widget? child,
      Key? key}) async {
    return ValueListenableBuilder(
        key: key,
        valueListenable: box.listenable(),
        builder: builder,
        child: child);
  }
}
