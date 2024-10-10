import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/models/win_num_model.dart';
import 'package:two_d/network/repository/win_number_repo.dart';

part 'win_num_event.dart';
part 'win_num_state.dart';

class WinNumBloc extends Bloc<WinNumEvent, WinNumState> {
  final WinNumRepoImpl _winNumRepoImpl;
  WinNumBloc(this._winNumRepoImpl) : super(WinNumInitial()) {
    on<WinNumEvent>((event, emit) {});
    on<TapWinNumEvent>((event, emit) async {
      emit(WinNumLoading());
      ResponseModel responseModel = await _winNumRepoImpl.getWinNum();
      if (responseModel.data.length < 1) {
        emit(WinNumClose());
      } else if (responseModel.msgState == MsgState.data) {
        WinNumModel winNumModel = WinNumModel.fromJson(responseModel.data);

        emit(WinNumSuccess(winNumModel: winNumModel));
      } else {
        String error = responseModel.data;
        emit(WinNumFail(error: error));
      }
    });
  }
}
