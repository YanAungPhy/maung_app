import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/auth_model.dart';
import '../../../models/response_model.dart';
import '../../../network/repository/singup_repo.dart';
import '../../../utils/const_text.dart';
import '../../../utils/shared_pref.dart';

part 'singup_event.dart';
part 'singup_state.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  final SingUpRepoImpl _singUpRepoImpl;
  SingupBloc(this._singUpRepoImpl) : super(SingupInitial()) {
    on<SingupEvent>((event, emit) {});
    on<TapSingupEvent>((event, emit) async {
      final String phone = event.phone;
      final String password = event.password;
      final String name = event.name;
      emit(SingupILoading());
      ResponseModel responseModel = await _singUpRepoImpl.singup(
          phone: phone, password: password, name: name);
      if (responseModel.msgState == MsgState.data) {
        AuthModel authModel = AuthModel.fromJson(responseModel.data);
        SharedPref.saveData(
            key: ConstText.token, value: authModel.accessToken!);
        SharedPref.saveData(
            key: ConstText.refreshToken, value: authModel.refreshToken!);
        emit(SingupSuccess(
          authModel: authModel,
        ));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(SingupFail(error: error));
      }
    });
  }
}
