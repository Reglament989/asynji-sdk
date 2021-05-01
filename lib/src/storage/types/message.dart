import 'package:hive/hive.dart';

part 'message.g.dart';

@HiveType(typeId: 1)
class Message {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String from;

  @HiveField(2)
  late String body;

  @HiveField(3)
  late String forward;

  @HiveField(4)
  late String reply;

  @HiveField(5)
  late String mediaUrl;

  @HiveField(6)
  late DateTime created;

  @HiveField(7)
  late DateTime modified;
}
