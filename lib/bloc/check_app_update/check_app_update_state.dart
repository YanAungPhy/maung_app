part of 'check_app_update_cubit.dart';

abstract class CheckAppUpdateState extends Equatable {
  const CheckAppUpdateState();

  @override
  List<Object> get props => [];
}

class CheckAppUpdateInitial extends CheckAppUpdateState {}

class CheckingUpdate extends CheckAppUpdateState {}

class CheckingUpdateFail extends CheckAppUpdateState {
  final String error;
  const CheckingUpdateFail(this.error);

  @override
  List<Object> get props => [error];
}

class CheckingUpdateSuccess extends CheckAppUpdateState {
  final CheckUpdateModel updateModel;
  const CheckingUpdateSuccess(this.updateModel);

  @override
  List<Object> get props => [updateModel];
}
