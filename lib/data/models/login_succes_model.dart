import 'dart:convert';

LoginSuccesResponse loginSuccesResponseFromJson(String str) =>
    LoginSuccesResponse.fromJson(json.decode(str));

String loginSuccesResponseToJson(LoginSuccesResponse data) =>
    json.encode(data.toJson());

class LoginSuccesResponse {
  LoginSuccesResponse({
    required this.token,
  });

  String token;

  factory LoginSuccesResponse.fromJson(Map<String, dynamic> json) =>
      LoginSuccesResponse(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
