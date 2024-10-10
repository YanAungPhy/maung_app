import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/check_update_model.dart';
import 'package:two_d/network/repository/check_app_update_repo.dart';

import '../../models/response_model.dart';

part 'check_app_update_state.dart';

class CheckAppUpdateCubit extends Cubit<CheckAppUpdateState> {
  final CheckAppUpdateRepoImpl _checkAppUpdateRepoImpl;
  CheckAppUpdateCubit(this._checkAppUpdateRepoImpl)
      : super(CheckAppUpdateInitial());

  void check() {
    emit(CheckingUpdate());
    _checkAppUpdateRepoImpl.check().then((value) {
      ResponseModel responseModel = value;
      if (responseModel.msgState == MsgState.data) {
        CheckUpdateModel updateModel =
            CheckUpdateModel.fromJson(responseModel.data);
        emit(CheckingUpdateSuccess(updateModel));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(CheckingUpdateFail(error.toString()));
      }
    }).catchError((e) => emit(CheckingUpdateFail(e.toString())));
  }
}
