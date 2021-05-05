import 'dart:convert';

import 'package:asynji_sdk/src/api/auth.dart';
import 'package:asynji_sdk/src/api/types/ws_event.dart';
import 'package:asynji_sdk/src/storage/controlers/global.controller.dart';
import 'package:asynji_sdk/src/storage/controlers/room.controller.dart';
import 'package:dio/dio.dart';

class SendController {
  final AuthController __authController = AuthController();
  final GlobalController __globalController = GlobalController();
  late final Dio __dio;

  SendController() {
    __dio = Dio();
    // Set default configs
    __dio.options.baseUrl = __globalController.getServerUri();
    __dio.options.connectTimeout = 5000; //5s
    __dio.options.receiveTimeout = 3000;
  }

  Future<bool> sendMessage(
      {required String roomId, required String body}) async {
    try {
      final raw = await __dio.post('/room/$roomId/send',
          data: json.encode({'body': body}));
      if (raw.statusCode == 201) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      if (e.message == 'Token expire') {
        await __authController.refreshTokens();
        return await sendMessage(roomId: roomId, body: body);
      }
      rethrow;
    }
  }

  Future sendInitinalSync(
      {int limit = 60, int offset = 0, String full = 'off'}) async {
    try {
      final raw = await __dio.get('/_/sync',
          queryParameters: {'limit': limit, 'offset': offset, 'full': full});
      if (raw.statusCode == 201) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      if (e.message == 'Token expire') {
        await __authController.refreshTokens();
        return await sendInitinalSync(limit: limit, offset: offset, full: full);
      }
      rethrow;
    }
  }
}
