import 'dart:convert';

import 'package:asynji_sdk/src/api/auth.dart';
import 'package:asynji_sdk/src/api/types/sync_body.dart';
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

  // TODO: need parsing response
  Future<bool> sendAboutRoom({required String roomId}) async {
    try {
      final raw = await __dio.get('/room/$roomId');
      return false;
    } on DioError catch (e) {
      if (e.message == 'Token expire') {
        await __authController.refreshTokens();
        return await sendAboutRoom(roomId: roomId);
      }
      rethrow;
    }
  }

  // TODO: avatar must be previusle uploaded and be a link
  Future<bool> createRoom(
      {required String roomName, required String avatar}) async {
    try {
      final raw = await __dio.post('/room/create',
          data: json.encode({'room_name': roomName, 'avatar': avatar}));
      if (raw.statusCode == 201) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      if (e.message == 'Token expire') {
        await __authController.refreshTokens();
        return await createRoom(roomName: roomName, avatar: avatar);
      }
      rethrow;
    }
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

  Future<SyncBody?> sendInitinalSync(
      {int limit = 60, int offset = 0, String full = 'off'}) async {
    try {
      final raw = await __dio.get('/_/sync',
          queryParameters: {'limit': limit, 'offset': offset, 'full': full});
      if (raw.statusCode == 200) {
        return SyncBody.fromJson(raw.data);
      }
    } on DioError catch (e) {
      if (e.message == 'Token expire') {
        await __authController.refreshTokens();
        return await sendInitinalSync(limit: limit, offset: offset, full: full);
      }
      rethrow;
    }
  }
}
