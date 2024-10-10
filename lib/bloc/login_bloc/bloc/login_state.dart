part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthModel authModel;
  const LoginSuccess({required this.authModel});

  @override
  List<Object> get props => [authModel];
}

class LoginFail extends LoginState {
  final String error;

  const LoginFail({required this.error});

  @override
  List<Object> get props => [error];
}
