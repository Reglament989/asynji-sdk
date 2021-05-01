import 'package:asynji_sdk/src/storage/controlers/message.controller.dart';
import 'package:asynji_sdk/src/storage/types/user.dart';
import 'package:hive/hive.dart';

part 'room.g.dart';

@HiveType(typeId: 1)
class Room {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String roomName;

  @HiveField(2)
  late List<User> members;

  @HiveField(3)
  late String avatar;

  @HiveField(4)
  late String owner;

  @HiveField(5)
  late bool hidden;

  @HiveField(6)
  late DateTime created;

  @HiveField(7)
  late DateTime modified;

  MessagesController getMessagesController(String roomId) {
    return MessagesController(roomId);
  }
}
