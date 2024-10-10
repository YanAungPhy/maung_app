part of 'refresh_token_bloc.dart';

abstract class RefreshTokenState extends Equatable {
  const RefreshTokenState();

  @override
  List<Object> get props => [];
}

class RefreshTokenInitial extends RefreshTokenState {}

class RefreshTokenLoading extends RefreshTokenState {}

class RefreshTokenSuccess extends RefreshTokenState {
  final AuthModel authModel;
  const RefreshTokenSuccess({required this.authModel});

  @override
  List<Object> get props => [authModel];
}

class RefreshTokenFail extends RefreshTokenState {
  final String error;

  const RefreshTokenFail({required this.error});

  @override
  List<Object> get props => [error];
}
