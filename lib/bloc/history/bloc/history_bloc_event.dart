part of 'history_bloc_bloc.dart';

abstract class HistoryBlocEvent extends Equatable {
  const HistoryBlocEvent();

  @override
  List<Object> get props => [];
}

class TapHistoryEvent extends HistoryBlocEvent {
  final String gameType;
  const TapHistoryEvent({required this.gameType});

  @override
  List<Object> get props => [gameType];
}

class TapHistoryMoreEvent extends HistoryBlocEvent {
  final String gameType;
  const TapHistoryMoreEvent({required this.gameType});

  @override
  List<Object> get props => [gameType];
}
