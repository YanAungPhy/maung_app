part of 'twod_history_bloc.dart';

abstract class TwodHistoryEvent extends Equatable {
  const TwodHistoryEvent();

  @override
  List<Object> get props => [];
}

class TapTwodHistoryEvent extends TwodHistoryEvent {}
