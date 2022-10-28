// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_transisi/data/models/list_user_model.dart';
import 'package:test_transisi/services/api_services.dart';
import 'package:test_transisi/utils/failure.dart';

part 'list_users_state.dart';

class ListUsersCubit extends Cubit<ListUsersState> {
  final ApiServices apiServices;
  ListUsersCubit(
    this.apiServices,
  ) : super(ListUsersInitial());
  int page = 1;
  void fetchUsers() async {
    try {
      if (state.hasReachedMaximum) {
        return;
      }
      emit(ListUsersLoading(state.users, state is ListUsersInitial));

      await apiServices.getListUser(page: page.toString()).then((value) {
        page++;
        final users = [...state.users, ...value.data!];
        final hasReachedMaximum = value.data!.isEmpty;
        return emit(ListUsersHasData(
            data: users, hasReachedMaximum: hasReachedMaximum));
      });
    } on ServerFailure catch (e) {
      emit(ListUsersFailed(error: e.message));
    }
  }
}
