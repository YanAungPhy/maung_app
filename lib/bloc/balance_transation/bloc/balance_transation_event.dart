part of 'balance_transation_bloc.dart';

abstract class BalanceTransationEvent extends Equatable {
  const BalanceTransationEvent();

  @override
  List<Object> get props => [];
}

class TapBalanceTransationEvent extends BalanceTransationEvent {
  final Map<String, dynamic> transationDetail;

  const TapBalanceTransationEvent({required this.transationDetail});
}
