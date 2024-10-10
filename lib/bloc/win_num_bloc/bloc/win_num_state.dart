part of 'win_num_bloc.dart';

abstract class WinNumState extends Equatable {
  const WinNumState();

  @override
  List<Object> get props => [];
}

class WinNumInitial extends WinNumState {}

class WinNumLoading extends WinNumState {}

class WinNumSuccess extends WinNumState {
  final WinNumModel winNumModel;
  const WinNumSuccess({required this.winNumModel});

  @override
  List<Object> get props => [winNumModel];
}

class WinNumFail extends WinNumState {
  final String error;

  const WinNumFail({required this.error});

  @override
  List<Object> get props => [error];
}

class WinNumClose extends WinNumState{}