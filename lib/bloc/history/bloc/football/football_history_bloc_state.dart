part of 'football_history_bloc.dart';

abstract class FootballHistoryBlocState extends Equatable {
  const FootballHistoryBlocState();

  @override
  List<Object?> get props => [];
}

class FootballHistoryBlocInitial extends FootballHistoryBlocState {}

class FootballHistoryBlocLoading extends FootballHistoryBlocState {}

class FootballHistoryBlocMore extends FootballHistoryBlocState {}

class FootballHistoryBlocSuccess extends FootballHistoryBlocState {
  final List<FootballHistoryModel> historyModelList;
  final bool isFirst;

  const FootballHistoryBlocSuccess({required this.historyModelList, required this.isFirst});

  @override
  List<Object?> get props => [historyModelList, isFirst];
}

class FootballHistoryBlocNoMore extends FootballHistoryBlocState {}

class FootballHistoryBlocFail extends FootballHistoryBlocState {
  final String error;

  const FootballHistoryBlocFail({required this.error});

  @override
  List<Object?> get props => [error];
}
