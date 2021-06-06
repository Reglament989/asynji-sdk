import 'package:hive/hive.dart';

part 'room_model.g.dart';

@HiveType(typeId: 2)
class Room extends HiveObject {
  @HiveField(0)
  late String roomName;
  @HiveField(1)
  late String avatar;
  @HiveField(2)
  late String owner;
  @HiveField(3)
  late List members;
}
