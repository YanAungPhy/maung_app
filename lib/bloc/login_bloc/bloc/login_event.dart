part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class TapLoginEvent extends LoginEvent {
  final String phone;
  final String password;

  const TapLoginEvent({required this.phone, required this.password});
}
