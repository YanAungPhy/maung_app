part of 'transacion_history_bloc.dart';

abstract class TransacionHistoryState extends Equatable {
  const TransacionHistoryState();

  @override
  List<Object> get props => [];
}

class TransacionHistoryInitial extends TransacionHistoryState {}

class TransacionHistoryLoading extends TransacionHistoryState {}

class TransacionHistorySuccess extends TransacionHistoryState {
  final List<TransHistoryModel> transHistoryModelList;
  final bool isFirst;
  const TransacionHistorySuccess({required this.transHistoryModelList,required this.isFirst});
  
  @override
  List<Object> get props => [transHistoryModelList,isFirst];
}

class TransacionHistoryFail extends TransacionHistoryState {
  final String error;

  const TransacionHistoryFail({required this.error});

  @override
  List<Object> get props => [error];
}

class TransacionHistoryNoMore extends TransacionHistoryState {}
