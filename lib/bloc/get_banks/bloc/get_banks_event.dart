part of 'get_banks_bloc.dart';

abstract class GetBanksEvent extends Equatable {
  const GetBanksEvent();

  @override
  List<Object> get props => [];
}

class TapGetBanksEvent extends GetBanksEvent {}
