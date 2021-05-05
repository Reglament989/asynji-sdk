import 'dart:convert';

import 'package:asynji_sdk/src/api/types/ws_event.dart';
import 'package:asynji_sdk/src/storage/controlers/global.controller.dart';
import 'package:asynji_sdk/src/storage/controlers/room.controller.dart';
import 'package:dio/dio.dart';

class AuthController {
  final GlobalController __globalController = GlobalController();
  late final Dio __dio;

  AuthController() {
    __dio = Dio();
    // Set default configs
    __dio.options.baseUrl = __globalController.getServerUri();
    __dio.options.connectTimeout = 5000; //5s
    __dio.options.receiveTimeout = 3000;
  }

  Future<void> __parseTokens(Response<dynamic> raw) async {
    final response = json.decode(raw.data);
    await __globalController.changeAuthenticated(
        response['token'] as String, response['refresh_token'] as String);
  }

  Future<void> newLogin(String username, String password) async {
    try {
      final raw = await __dio.post('/auth/login',
          data: json.encode({'username': username, 'password': password}));
      await __parseTokens(raw);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> createUser(
      String username, String password, String email) async {
    try {
      final raw = await __dio.put('/auth/registration',
          data: json.encode(
              {'username': username, 'password': password, 'email': email}));
      if (raw.statusCode == 201) {
        await newLogin(username, password);
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> refreshTokens() async {
    try {
      final raw = await __dio.patch('/auth/refresh',
          data: json
              .encode({'refresh_token': __globalController.getRefreshToken()}));
      await __parseTokens(raw);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
