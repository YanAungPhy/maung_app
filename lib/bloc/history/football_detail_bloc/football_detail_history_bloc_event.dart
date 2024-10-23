part of 'football_detail_history_bloc.dart';

abstract class FootballDetailHistoryBlocEvent extends Equatable {
  const FootballDetailHistoryBlocEvent();

  @override
  List<Object?> get props => [];
}

// This should belong to FootballDetailHistoryBloc
class FetchFootballHistoryDetailEvent extends FootballDetailHistoryBlocEvent {
  final int historyId;

  const FetchFootballHistoryDetailEvent({required this.historyId});

  @override
  List<Object?> get props => [historyId];
}
