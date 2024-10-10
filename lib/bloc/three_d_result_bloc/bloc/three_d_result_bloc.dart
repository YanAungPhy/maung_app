import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/models/three_d_result_model.dart';

import '../../../network/repository/three_d_result_repo.dart';

part 'three_d_result_event.dart';
part 'three_d_result_state.dart';

class ThreeDResultBloc extends Bloc<ThreeDResultEvent, ThreeDResultState> {
  final ThreeDResultRepoImpl _threeDResultRepoImpl;
  ThreeDResultBloc(this._threeDResultRepoImpl) : super(ThreeDResultInitial()) {
    on<ThreeDResultEvent>((event, emit) {});
    on<TapThreeDResultEvent>((event, emit) async {
      emit(ThreeDResultLoading());

      ResponseModel responseModel =
          await _threeDResultRepoImpl.getThreeDResult();
      if (responseModel.msgState == MsgState.data) {
        List<ThreeDResultModel> threeDResultList =
            (responseModel.data["data"] as List)
                .map((e) => ThreeDResultModel.fromJson(e))
                .toList();

        emit(ThreeDResultSuccess(threeDResultList: threeDResultList));
      } else {
        String error = responseModel.data;
        emit(ThreeDResultFail(error: error));
      }
    });
  }
}
