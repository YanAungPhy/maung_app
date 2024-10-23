
part of 'football_detail_history_bloc.dart';

abstract class FootballDetailHistoryBlocState extends Equatable {
  const FootballDetailHistoryBlocState();

  @override
  List<Object?> get props => [];
}

class FootballDetailHistoryBlocInitial extends FootballDetailHistoryBlocState {}

class FootballDetailHistoryBlocLoading extends FootballDetailHistoryBlocState {}

class FootballDetailHistoryBlocMore extends FootballDetailHistoryBlocState {}

class FootballDetailHistoryBlocSuccess extends FootballDetailHistoryBlocState {
  final List<FootballDetailHistoryModel> historyModelList;
  final bool isFirst;

  const FootballDetailHistoryBlocSuccess({required this.historyModelList, required this.isFirst});

  @override
  List<Object?> get props => [historyModelList, isFirst];
}

class FootballDetailHistoryBlocNoMore extends FootballDetailHistoryBlocState {}

class FootballDetailHistoryBlocFail extends FootballDetailHistoryBlocState {
  final String error;

  const FootballDetailHistoryBlocFail({required this.error});

  @override
  List<Object?> get props => [error];
}


