// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  final String token;
  const AuthSucces({
    required this.token,
  });
  @override
  List<Object> get props => [token];
}

class AuthFailed extends AuthState {
  final String error;
  const AuthFailed({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
