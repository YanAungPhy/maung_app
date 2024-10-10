part of 'bet_bloc.dart';

abstract class BetEvent extends Equatable {
  const BetEvent();

  @override
  List<Object> get props => [];
}

class TapBetEvent extends BetEvent {
  final BetBody betBody;

  const TapBetEvent({required this.betBody});

  @override
  List<Object> get props => [betBody];
}
