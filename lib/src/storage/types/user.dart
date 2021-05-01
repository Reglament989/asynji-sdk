import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String username;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String avatar;

  @HiveField(4)
  late String currentFcmToken;

  @HiveField(5)
  late bool hidden;

  @HiveField(6)
  late DateTime created;

  @HiveField(7)
  late DateTime modified;
}
