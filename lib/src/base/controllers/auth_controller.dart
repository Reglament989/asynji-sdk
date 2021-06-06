import "package:asynji_sdk/src/base/controllers/global_controller.dart"
    show GlobalController;
import "package:asynji_sdk/src/base/types/responses.dart";
import "package:dio/dio.dart" show DioError;

class AuthController extends GlobalController {
  @override
  Future<void> init() async {
    await super.init();
  }

  Future<void> registration(
      String email, String username, String password) async {
    try {
      final result = await dio.put("/auth/registration",
          data: {"username": username, "email": email, "password": password});
      final response = RegistrationResponse.fromJson(result.data);
      await this.setUserId(response.userId);
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<void> login(String username, String password) async {
    final result = await dio.post("/auth/login",
        data: {"username": username, "password": password});
    final response = LoginResponse.fromJson(result.data);
    globalOptions!.token = response.token;
    globalOptions!.refresh_token = response.refreshToken;
  }

  @override
  Future<void> save() async {
    await globalOptions!.save();
  }
}
