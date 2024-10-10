import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/auth_model.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/utils/global_import.dart';
import '../../../network/repository/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepoImpl loginRepoImpl;
  LoginBloc(this.loginRepoImpl) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<TapLoginEvent>(
      (event, emit) async {
        final String phone = event.phone;
        final String password = event.password;
        emit(LoginLoading());
        ResponseModel responseModel =
            await loginRepoImpl.login(phone: phone, password: password);
        if (responseModel.msgState == MsgState.data) {
          AuthModel authModel = AuthModel.fromJson(responseModel.data);
          SharedPref.saveData(
              key: ConstText.token, value: authModel.accessToken!);
          SharedPref.saveData(
              key: ConstText.refreshToken, value: authModel.refreshToken!);
          emit(LoginSuccess(
            authModel: authModel,
          ));
        } else if (responseModel.msgState == MsgState.error) {
          String error = responseModel.data;
          emit(LoginFail(error: error));
        }
      },
    );
  }
}
