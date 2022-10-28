import 'dart:convert';

RegisterSuccesResponse registerSuccesResponseFromJson(String str) =>
    RegisterSuccesResponse.fromJson(json.decode(str));

String registerSuccesResponseToJson(RegisterSuccesResponse data) =>
    json.encode(data.toJson());

class RegisterSuccesResponse {
  RegisterSuccesResponse({
    required this.token,
    required this.id,
  });

  String token;
  int id;

  factory RegisterSuccesResponse.fromJson(Map<String, dynamic> json) =>
      RegisterSuccesResponse(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
      };
}
