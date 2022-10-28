import 'dart:convert';

import 'package:test_transisi/data/models/list_user_model.dart';

DetailUserResponse detailUserResponseFromJson(String str) =>
    DetailUserResponse.fromJson(json.decode(str));

String detailUserResponseToJson(DetailUserResponse data) =>
    json.encode(data.toJson());

class DetailUserResponse {
  DetailUserResponse({
    this.data,
    this.support,
  });

  User? data;
  Support? support;

  factory DetailUserResponse.fromJson(Map<String, dynamic> json) =>
      DetailUserResponse(
        data: User.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "support": support!.toJson(),
      };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
