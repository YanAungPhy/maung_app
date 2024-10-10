part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final UserModel userModel;
  const GetUserSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class GetUserFail extends GetUserState {
  final String error;

  const GetUserFail({required this.error});

  @override
  List<Object> get props => [error];
}
