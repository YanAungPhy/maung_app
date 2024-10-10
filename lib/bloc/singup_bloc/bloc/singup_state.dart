part of 'singup_bloc.dart';

abstract class SingupState extends Equatable {
  const SingupState();

  @override
  List<Object> get props => [];
}

class SingupInitial extends SingupState {}

class SingupILoading extends SingupState {}

class SingupSuccess extends SingupState {
  final AuthModel authModel;
  const SingupSuccess({required this.authModel});

  @override
  List<Object> get props => [authModel];
}

class SingupFail extends SingupState {
  final String error;

  const SingupFail({required this.error});

  @override
  List<Object> get props => [error];
}
