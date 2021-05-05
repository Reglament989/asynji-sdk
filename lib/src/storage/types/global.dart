import 'package:hive/hive.dart';

part 'global.g.dart';

@HiveType(typeId: 4)
class Global extends HiveObject {
  @HiveField(0, defaultValue: true)
  String token = '';

  @HiveField(1, defaultValue: true)
  String refresh_token = '';

  @HiveField(2, defaultValue: true)
  bool isAuthenticated = false;

  @HiveField(3, defaultValue: true)
  String serverUri = 'ws://localhost:51830';
}
