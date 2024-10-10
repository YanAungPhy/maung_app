part of 'twod_history_bloc.dart';

abstract class TwodHistoryState extends Equatable {
  const TwodHistoryState();

  @override
  List<Object> get props => [];
}

class TwodHistoryInitial extends TwodHistoryState {}

class TwodHistoryLoading extends TwodHistoryState {}

class TwodHistorySuccess extends TwodHistoryState {
  final List<TwoDHistoryModel> twodHistoryModelList;

  const TwodHistorySuccess({required this.twodHistoryModelList});

  @override
  List<Object> get props => [twodHistoryModelList];
}

class TwodHistoryFail extends TwodHistoryState {
  final String error;

  const TwodHistoryFail({required this.error});

  @override
  List<Object> get props => [error];
}
