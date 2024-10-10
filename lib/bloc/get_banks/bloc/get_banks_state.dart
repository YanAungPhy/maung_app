part of 'get_banks_bloc.dart';

abstract class GetBanksState extends Equatable {
  const GetBanksState();

  @override
  List<Object> get props => [];
}

class GetBanksInitial extends GetBanksState {}

class GetBanksLoading extends GetBanksState {}

class GetBanksSuccess extends GetBanksState {
  final List<BankModel> banksmodelList;

  const GetBanksSuccess({required this.banksmodelList});

  @override
  List<Object> get props => [banksmodelList];
}

class GetBanksFail extends GetBanksState {
  final String error;

  const GetBanksFail({required this.error});

  @override
  List<Object> get props => [error];
}
