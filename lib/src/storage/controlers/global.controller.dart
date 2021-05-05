import 'package:asynji_sdk/src/storage/types/global.dart';
import 'package:hive/hive.dart';

class GlobalController {
  late Global global;

  GlobalController() {
    global = Hive.box<Global>('Global-asynji').get('global')!;
    __runSync();
  }

  String getServerUri() {
    return global.serverUri;
  }

  String getCurrentToken() {
    if (!global.isAuthenticated) {
      throw Exception('Cannot get token if not authenticated.');
    }
    return global.token;
  }

  String getRefreshToken() {
    if (!global.isAuthenticated) {
      throw Exception('Cannot get token if not authenticated.');
    }
    return global.refresh_token;
  }

  Future<void> changeAuthenticated(String token, String refreshToken) async {
    if (token != '' && refreshToken != '') {
      global.token = token;
      global.refresh_token = refreshToken;
      global.isAuthenticated = true;
      await global.save();
      return;
    }
    throw Exception('Cannot set null values as tokens.');
  }

  void __runSync() {
    final stream = Hive.box<Global>('Global-asynji').watch(key: 'global');
    stream.listen((_) {
      global = Hive.box<Global>('Global-asynji').get('global')!;
    });
  }
}
