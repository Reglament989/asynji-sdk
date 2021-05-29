import "dart:convert" show json;

class RegistrationResponse {
  final String userId;
  RegistrationResponse(this.userId);
  factory RegistrationResponse.fromJson(data) {
    final j = json.decode(data);
    return RegistrationResponse(j["userId"] as String);
  }
}

class LoginResponse {
  final String refreshToken;
  final String token;
  final String message;
  LoginResponse(this.refreshToken, this.token, this.message);

  factory LoginResponse.fromJson(data) {
    final j = json.decode(data);
    return LoginResponse(j["refresh_token"] as String, j["token"] as String,
        j["message"] as String);
  }
}
