import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/history_model.dart';
import 'package:two_d/models/response_model.dart';
import '../../../network/repository/history_repo.dart';

part 'history_bloc_event.dart';
part 'history_bloc_state.dart';

class HistoryBlocBloc extends Bloc<HistoryBlocEvent, HistoryBlocState> {
  final GetHistoryRepoImpl _getHistoryRepoImpl;
  int page = 0;
  HistoryBlocBloc(this._getHistoryRepoImpl) : super(HistoryBlocInitial()) {
    on<HistoryBlocEvent>((event, emit) {});
    on<TapHistoryEvent>((event, emit) async {
      page = 0;
      emit(HistoryBlocLoading());
      String gameType = event.gameType;
      ResponseModel responseModel =
          await _getHistoryRepoImpl.getHistory(type: gameType, page: page);

      if (responseModel.msgState == MsgState.data) {
        List<HistoryModel> historyModelList =
            (responseModel.data['list'] as List)
                .map((e) => HistoryModel.fromJson(e))
                .toList();

        emit(HistoryBlocSuccess(
            historyModelList: historyModelList, isFirst: true));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(HistoryBlocFail(error: error));
      }
    });

    on<TapHistoryMoreEvent>((event, emit) async {
      emit(HistoryBlocMore());
      page++;
      String gameType = event.gameType;
      ResponseModel responseModel =
          await _getHistoryRepoImpl.getHistory(type: gameType, page: page);

      if (responseModel.msgState == MsgState.data) {
        List<HistoryModel> historyModelList =
            (responseModel.data['list'] as List)
                .map((e) => HistoryModel.fromJson(e))
                .toList();

        if (historyModelList.isNotEmpty) {
          emit(HistoryBlocSuccess(
              historyModelList: historyModelList, isFirst: false));
        } else {
          emit(HistoryBlocNoMore());
        }
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(HistoryBlocFail(error: error));
      }
    });
  }
}
