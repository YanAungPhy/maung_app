part of 'get_maung_match_cubit.dart';

class GetMaungMatchState extends Equatable {
  const GetMaungMatchState();

  @override
  List<Object> get props => [];
}

class GetMaungMatchInitial extends GetMaungMatchState {}

class GetMaungMatchLoading extends GetMaungMatchState {}

class GetMaungMatchSuccess extends GetMaungMatchState {
  final List<SoccerModel> maungList;
  const GetMaungMatchSuccess(this.maungList);

  @override
  List<Object> get props => [maungList];
}

class GetMaungMatchFail extends GetMaungMatchState {
  final String message;
  const GetMaungMatchFail(this.message);

  @override
  List<Object> get props => [message];
}
