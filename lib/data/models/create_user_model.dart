import 'dart:convert';

CreateUserSuccesResponse createUserSuccesResponseFromJson(String str) =>
    CreateUserSuccesResponse.fromJson(json.decode(str));

String createUserSuccesResponseToJson(CreateUserSuccesResponse data) =>
    json.encode(data.toJson());

class CreateUserSuccesResponse {
  CreateUserSuccesResponse({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String? name;
  String? job;
  String? id;
  DateTime? createdAt;

  factory CreateUserSuccesResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserSuccesResponse(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
      };
}
