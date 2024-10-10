part of 'bet_bloc.dart';

abstract class BetState extends Equatable {
  const BetState();

  @override
  List<Object> get props => [];
}

class BetInitial extends BetState {}

class BetLoading extends BetState {}

class BetSuccess extends BetState {}

class BetFail extends BetState {
  final String error;

  const BetFail({required this.error});

  @override
  List<Object> get props => [error];
}
