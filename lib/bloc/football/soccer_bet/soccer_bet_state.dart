part of 'soccer_bet_cubit.dart';

class SoccerBetState extends Equatable {
  const SoccerBetState();

  @override
  List<Object> get props => [];
}

class SoccerBetInitial extends SoccerBetState {}

class SoccerBetLoading extends SoccerBetState {}

class SoccerBetSuccess extends SoccerBetState {}

class SoccerBetFail extends SoccerBetState {
  final String error;
  const SoccerBetFail(this.error);

  @override
  List<Object> get props => [error];
}
