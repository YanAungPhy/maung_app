import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';

import '../../../network/repository/change_password_repo.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepoImpl _changePasswordRepoImpl;
  ChangePasswordBloc(this._changePasswordRepoImpl)
      : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {});
    on<TapChangePasswordEvent>((event, emit) async {
      emit(ChangePasswordLoading());
      String newPassword = event.newPassword;
      String oldPassword = event.oldPassword;
      ResponseModel responseModel = await _changePasswordRepoImpl
          .changePassword(oldPassword: oldPassword, newPassword: newPassword);

      if (responseModel.msgState == MsgState.data) {
        emit(ChangePasswordSuccess());
      } else if (responseModel.msgState == MsgState.error) {
        emit(ChangePasswordFail(error: responseModel.data));
      }
    });
  }
}
