import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';

import '../../../models/football_detail_history_model.dart';
import '../../../network/repository/football_detail_history_repo.dart';
part 'football_detail_history_bloc_event.dart';
part 'football_detail_history_state.dart';

class FootballDetailHistoryBloc extends Bloc<FootballDetailHistoryBlocEvent, FootballDetailHistoryBlocState> {
  final FootballDetailGetHistoryRepoImpl _getHistoryRepoImpl;
  int page = 0;

  FootballDetailHistoryBloc(this._getHistoryRepoImpl) : super(FootballDetailHistoryBlocInitial()) {
    on<FetchFootballHistoryDetailEvent>(_onFetchFootballHistoryDetailEvent);
  }

  Future<void> _onFetchFootballHistoryDetailEvent(
      FootballDetailHistoryBlocEvent event, Emitter<FootballDetailHistoryBlocState> emit) async {
    page = 0;
    emit(FootballDetailHistoryBlocLoading());

    ResponseModel responseModel = await _getHistoryRepoImpl.getDetailHistory(historyId: 26);

    if (responseModel.msgState == MsgState.data) {
      List<FootballDetailHistoryModel> historyModelList = (responseModel.data['list'] as List)
          .map((e) => FootballDetailHistoryModel.fromJson(e))
          .toList();

      emit(FootballDetailHistoryBlocSuccess(
          historyModelList: historyModelList, isFirst: true));
    } else if (responseModel.msgState == MsgState.error) {
      String error = responseModel.data;
      emit(FootballDetailHistoryBlocFail(error: error));
    }
  }

}
