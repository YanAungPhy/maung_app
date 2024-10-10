part of 'get_bawdi_match_cubit.dart';

class GetBawdiMatchState extends Equatable {
  const GetBawdiMatchState();

  @override
  List<Object> get props => [];
}

class GetBawdiMatchInitial extends GetBawdiMatchState {}

class GetBawdiMatchLoading extends GetBawdiMatchState {}

class GetBawdiMatchSuccess extends GetBawdiMatchState {
  final List<SoccerModel> bawdiList;
  const GetBawdiMatchSuccess(this.bawdiList);

  @override
  List<Object> get props => [bawdiList];
}

class GetBawdiMatchFail extends GetBawdiMatchState {
  final String message;
  const GetBawdiMatchFail(this.message);

  @override
  List<Object> get props => [message];
}
