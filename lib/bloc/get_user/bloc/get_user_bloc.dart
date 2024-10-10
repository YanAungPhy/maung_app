import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/auth_model.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/utils/global_import.dart';
import '../../../network/repository/get_user_repo.dart';
part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GetUserRepoImpl _getUserRepoImpl;
  GetUserBloc(this._getUserRepoImpl) : super(GetUserInitial()) {
    on<GetUserEvent>((event, emit) {});
    on<TapGetUserEvent>((event, emit) async {
      emit(GetUserLoading());
      ResponseModel responseModel = await _getUserRepoImpl.getUser();
      if (responseModel.msgState == MsgState.data) {
        UserModel userModel = UserModel.fromJson(responseModel.data);
        emit(GetUserSuccess(userModel: userModel));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(GetUserFail(error: error));
      }
    });
  }
}
