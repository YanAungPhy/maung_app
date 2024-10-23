import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import '../../../../models/football_history_model.dart';
import '../../../../network/repository/football_history_repo.dart';
import 'football/football_history_bloc.dart';
part 'football_history_bloc_state.dart';

class FootballHistoryBloc extends Bloc<FootballHistoryBlocEvent, FootballHistoryBlocState> {
  final FootballGetHistoryRepoImpl _getHistoryRepoImpl;
  int page = 0;

  FootballHistoryBloc(this._getHistoryRepoImpl) : super(FootballHistoryBlocInitial()) {
    on<FetchFootballHistoryEvent>(_onFetchFootballHistoryEvent);
    on<FootballTapHistoryMoreEvent>(_onFootballTapHistoryMoreEvent);
  }

  Future<void> _onFetchFootballHistoryEvent(
      FetchFootballHistoryEvent event, Emitter<FootballHistoryBlocState> emit) async {
    page = 0;
    emit(FootballHistoryBlocLoading());

    ResponseModel responseModel = await _getHistoryRepoImpl.getHistory(type: "2D", page: page);

    if (responseModel.msgState == MsgState.data) {
      List<FootballHistoryModel> historyModelList = (responseModel.data['list'] as List)
          .map((e) => FootballHistoryModel.fromJson(e))
          .toList();

      emit(FootballHistoryBlocSuccess(
          historyModelList: historyModelList, isFirst: true));
    } else if (responseModel.msgState == MsgState.error) {
      String error = responseModel.data;
      emit(FootballHistoryBlocFail(error: error));
    }
  }

  Future<void> _onFootballTapHistoryMoreEvent(
      FootballTapHistoryMoreEvent event, Emitter<FootballHistoryBlocState> emit) async {
    emit(FootballHistoryBlocMore());
    page++;

    ResponseModel responseModel = await _getHistoryRepoImpl.getHistory(type: event.gameType, page: page);

    if (responseModel.msgState == MsgState.data) {
      List<FootballHistoryModel> historyModelList = (responseModel.data['list'] as List)
          .map((e) => FootballHistoryModel.fromJson(e))
          .toList();

      if (historyModelList.isNotEmpty) {
        emit(FootballHistoryBlocSuccess(
            historyModelList: historyModelList, isFirst: false));
      } else {
        emit(FootballHistoryBlocNoMore());
      }
    } else if (responseModel.msgState == MsgState.error) {
      String error = responseModel.data;
      emit(FootballHistoryBlocFail(error: error));
    }
  }
}
