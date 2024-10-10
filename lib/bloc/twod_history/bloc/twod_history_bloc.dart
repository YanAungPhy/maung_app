import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/models/twod_history_model.dart';

import '../../../network/repository/twod_history_repo.dart';

part 'twod_history_event.dart';
part 'twod_history_state.dart';

class TwodHistoryBloc extends Bloc<TwodHistoryEvent, TwodHistoryState> {
  final TwoDHistoryRepoImpl _dHistoryRepoImpl;
  TwodHistoryBloc(this._dHistoryRepoImpl) : super(TwodHistoryInitial()) {
    on<TwodHistoryEvent>((event, emit) {});
    on<TapTwodHistoryEvent>((event, emit) async {
      emit(TwodHistoryLoading());

      ResponseModel responseModel = await _dHistoryRepoImpl.getResultHistory();

      if (responseModel.msgState == MsgState.data) {
        List<TwoDHistoryModel> twoDHistoryModelList =
            (responseModel.data["data"] as List)
                .map((e) => TwoDHistoryModel.fromJson(e))
                .toList();

        emit(TwodHistorySuccess(twodHistoryModelList: twoDHistoryModelList));
      } else {
        String error = responseModel.data;
        emit(TwodHistoryFail(error: error));
      }
    });
  }
}
