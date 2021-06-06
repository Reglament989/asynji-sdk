import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  @HiveField(0)
  String token = '';
  @HiveField(1)
  String refresh_token = '';
  @HiveField(2)
  String username = '';
  @HiveField(3)
  String userId = '';
}
