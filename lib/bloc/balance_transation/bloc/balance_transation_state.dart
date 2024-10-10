part of 'balance_transation_bloc.dart';

abstract class BalanceTransationState extends Equatable {
  const BalanceTransationState();

  @override
  List<Object> get props => [];
}

class BalanceTransationInitial extends BalanceTransationState {}

class BalanceTransationLoading extends BalanceTransationState {}

class BalanceTransationSuccess extends BalanceTransationState {}

class BalanceTransationFail extends BalanceTransationState {
  final String error;

  const BalanceTransationFail({required this.error});

  @override
  List<Object> get props => [error];
}
