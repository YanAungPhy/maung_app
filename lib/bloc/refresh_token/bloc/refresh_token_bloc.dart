import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/network/repository/refresh_token_repo.dart';
import '../../../models/auth_model.dart';
import '../../../models/response_model.dart';
import '../../../utils/const_text.dart';
import '../../../utils/shared_pref.dart';
part 'refresh_token_event.dart';
part 'refresh_token_state.dart';

class RefreshTokenBloc extends Bloc<RefreshTokenEvent, RefreshTokenState> {
  final RefreshTokenRepoImpl _refreshTokenRepoImpl;
  RefreshTokenBloc(this._refreshTokenRepoImpl) : super(RefreshTokenInitial()) {
    on<RefreshTokenEvent>((event, emit) {});
    on<TapRefreshTokenEvent>(
      (event, emit) async {
        final String refreshToken = event.refreshToken;
        emit(RefreshTokenLoading());
        ResponseModel responseModel = await _refreshTokenRepoImpl.refreshToken(
            refreshToken: refreshToken);
        if (responseModel.msgState == MsgState.data) {
          AuthModel authModel = AuthModel.fromJson(responseModel.data);
          SharedPref.saveData(
              key: ConstText.token, value: authModel.accessToken!);
          emit(RefreshTokenSuccess(
            authModel: authModel,
          ));
        } else if (responseModel.msgState == MsgState.error) {
          String error = responseModel.data;
          emit(RefreshTokenFail(error: error));
        }
      },
    );
  }
}
