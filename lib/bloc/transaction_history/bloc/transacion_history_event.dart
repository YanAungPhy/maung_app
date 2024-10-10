part of 'transacion_history_bloc.dart';

abstract class TransacionHistoryEvent extends Equatable {
  const TransacionHistoryEvent();

  @override
  List<Object> get props => [];
}

class TapTransactionHistoryEvent extends TransacionHistoryEvent {}
class TapTransactionHistoryMoreEvent extends TransacionHistoryEvent {}
