import 'package:hive/hive.dart';

part 'global.g.dart';

@HiveType(typeId: 4)
class Global extends HiveObject {
  @HiveField(0)
  String token = '';

  @HiveField(1)
  String refresh_token = '';

  @HiveField(2)
  bool isAuthenticated = false;

  @HiveField(3)
  String serverUri = 'ws://localhost:51830';
}
