// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_transisi/services/api_services.dart';
import 'package:test_transisi/utils/failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiServices apiServices;
  AuthCubit(
    this.apiServices,
  ) : super(AuthInitial());

  // Login Method
  void login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      final response =
          await apiServices.login(email: email, password: password);

      emit(AuthSucces(token: response.token));
    } on ServerFailure catch (e) {
      emit(AuthFailed(error: e.message));
    }
  }
}
