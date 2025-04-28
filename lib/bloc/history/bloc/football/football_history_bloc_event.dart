part of 'football_history_bloc.dart';

abstract class FootballHistoryBlocEvent extends Equatable {
  const FootballHistoryBlocEvent();

  @override
  List<Object?> get props => [];
}

class FetchFootballHistoryEvent extends FootballHistoryBlocEvent {}

class FootballTapHistoryMoreEvent extends FootballHistoryBlocEvent {
  final String gameType;

  const FootballTapHistoryMoreEvent({required this.gameType});

  @override
  List<Object?> get props => [gameType];
}


