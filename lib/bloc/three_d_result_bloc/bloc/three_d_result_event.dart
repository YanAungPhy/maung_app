part of 'three_d_result_bloc.dart';

abstract class ThreeDResultEvent extends Equatable {
  const ThreeDResultEvent();

  @override
  List<Object> get props => [];
}

class TapThreeDResultEvent extends ThreeDResultEvent{}