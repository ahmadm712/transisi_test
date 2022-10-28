// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_transisi/data/models/create_user_model.dart';
import 'package:test_transisi/services/api_services.dart';
import 'package:test_transisi/utils/failure.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  ApiServices apiServices;
  CreateUserCubit(
    this.apiServices,
  ) : super(CreateUserInitial());
  void createUser({required String name, required String job}) async {
    try {
      emit(CreateUserLoading());

      final data = await apiServices.createUser(name: name, job: job);
      emit(CreateUserSuccess(data: data));
    } on ServerFailure catch (e) {
      emit(CreateUserFailed(error: e.message));
    }
  }
}
