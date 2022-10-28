// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_user_cubit.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final CreateUserSuccesResponse data;
  const CreateUserSuccess({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class CreateUserFailed extends CreateUserState {
  final String error;
  const CreateUserFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
