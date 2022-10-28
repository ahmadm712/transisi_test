// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_user_cubit.dart';

abstract class DetailUserState extends Equatable {
  const DetailUserState();

  @override
  List<Object> get props => [];
}

class DetailUserInitial extends DetailUserState {}

class DetailUserLoading extends DetailUserState {}

class DetailUserHasData extends DetailUserState {
  final User data;
  const DetailUserHasData({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class DetailUserFailed extends DetailUserState {
  final String error;
  const DetailUserFailed({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
