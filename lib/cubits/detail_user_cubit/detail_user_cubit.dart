// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_transisi/data/models/detail_user_model.dart';
import 'package:test_transisi/data/models/list_user_model.dart';

import 'package:test_transisi/services/api_services.dart';
import 'package:test_transisi/utils/failure.dart';

part 'detail_user_state.dart';

class DetailUserCubit extends Cubit<DetailUserState> {
  ApiServices apiServices;
  DetailUserCubit(
    this.apiServices,
  ) : super(DetailUserInitial());

  void fetchDetailUser({required String id}) async {
    try {
      emit(DetailUserLoading());
      final data = await apiServices.getDetailUser(id: id);
      emit(DetailUserHasData(data: data.data!));
    } on ServerFailure catch (e) {
      emit(DetailUserFailed(error: e.message));
    }
  }
}
