// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_users_cubit.dart';

abstract class ListUsersState extends Equatable {
  ListUsersState(
      {this.users = const <Users>[], required this.hasReachedMaximum});
  List<Users> users;
  bool hasReachedMaximum;
  @override
  List<Object> get props => [users];
}

class ListUsersInitial extends ListUsersState {
  ListUsersInitial() : super(hasReachedMaximum: false);
}

class ListUsersLoading extends ListUsersState {
  final bool isInitial;
  ListUsersLoading(
    final List<Users> users,
    this.isInitial,
  ) : super(users: users, hasReachedMaximum: false);
}

class ListUsersHasData extends ListUsersState {
  List<Users> data;
  final bool hasReachedMaximum;
  ListUsersHasData({
    required this.data,
    required this.hasReachedMaximum,
  }) : super(users: data, hasReachedMaximum: hasReachedMaximum);
  @override
  List<Object> get props => [data, hasReachedMaximum];
}

class ListUsersFailed extends ListUsersState {
  final String error;
  ListUsersFailed({
    required this.error,
  }) : super(hasReachedMaximum: false);
  @override
  List<Object> get props => [error];
}
