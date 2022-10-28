import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_transisi/data/models/list_user_model.dart';
import 'package:test_transisi/data/models/login_succes_model.dart';
import 'package:test_transisi/data/models/register_succes_model.dart';
import 'package:test_transisi/shared/constants.dart';
import 'package:test_transisi/utils/failure.dart';

class ApiServices {
  Future<LoginSuccesResponse> login(
      {required String email, required String password}) async {
    try {
      final data = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(
          "${baseUrl}login",
        ),
        body: data,
      );

      if (response.statusCode == 200) {
        return loginSuccesResponseFromJson(response.body);
      } else {
        throw ServerFailure(response.body);
      }
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  Future<RegisterSuccesResponse> register(
      {required String email, required String password}) async {
    try {
      final data = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(
          "${baseUrl}register",
        ),
        body: data,
      );

      if (response.statusCode == 200) {
        return registerSuccesResponseFromJson(response.body);
      } else {
        throw ServerFailure(response.body);
      }
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }

  Future<ListUserResponse> getListUser({String page = '1'}) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${baseUrl}users?page=$page",
        ),
      );

      if (response.statusCode == 200) {
        return listUserResponseFromJson(response.body);
      } else {
        throw ServerFailure(response.body);
      }
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
