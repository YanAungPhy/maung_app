part of 'three_d_result_bloc.dart';

abstract class ThreeDResultState extends Equatable {
  const ThreeDResultState();

  @override
  List<Object> get props => [];
}

class ThreeDResultInitial extends ThreeDResultState {}

class ThreeDResultLoading extends ThreeDResultState {}

class ThreeDResultSuccess extends ThreeDResultState {
  final List<ThreeDResultModel> threeDResultList;
  const ThreeDResultSuccess({required this.threeDResultList});

  @override
  List<Object> get props => [threeDResultList];
}

class ThreeDResultFail extends ThreeDResultState {
  final String error;
  const ThreeDResultFail({required this.error});

  @override
  List<Object> get props => [error];
}
