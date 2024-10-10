part of 'singup_bloc.dart';

abstract class SingupEvent extends Equatable {
  const SingupEvent();

  @override
  List<Object> get props => [];
}

class TapSingupEvent extends SingupEvent {
  final String phone;
  final String password;
  final String name;

  const TapSingupEvent(
      {required this.phone, required this.password, required this.name});
}
