
part of 'body_soccer_bet_cubit.dart';

class BodySoccerBetState extends Equatable {
  const BodySoccerBetState();

  @override
  List<Object> get props => [];
}

class BodySoccerBetInitial extends BodySoccerBetState {}

class BodySoccerBetLoading extends BodySoccerBetState {}

class BodySoccerBetSuccess extends BodySoccerBetState {}

class BodySoccerBetFail extends BodySoccerBetState {
  final String error;
  const BodySoccerBetFail(this.error);

  @override
  List<Object> get props => [error];
}
