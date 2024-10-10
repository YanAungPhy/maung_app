part of 'history_bloc_bloc.dart';

abstract class HistoryBlocState extends Equatable {
  const HistoryBlocState();

  @override
  List<Object> get props => [];
}

class HistoryBlocInitial extends HistoryBlocState {}

class HistoryBlocLoading extends HistoryBlocState {}

class HistoryBlocSuccess extends HistoryBlocState {
  final List<HistoryModel> historyModelList;
  final bool isFirst;

  const HistoryBlocSuccess(
      {required this.historyModelList, required this.isFirst});
}

class HistoryBlocFail extends HistoryBlocState {
  final String error;

  const HistoryBlocFail({required this.error});

  @override
  List<Object> get props => [error];
}

class HistoryBlocNoMore extends HistoryBlocState {}

class HistoryBlocMore extends HistoryBlocState {}
