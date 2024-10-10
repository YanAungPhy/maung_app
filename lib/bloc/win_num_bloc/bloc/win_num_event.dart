part of 'win_num_bloc.dart';

abstract class WinNumEvent extends Equatable {
  const WinNumEvent();

  @override
  List<Object> get props => [];
}

class TapWinNumEvent extends WinNumEvent{}