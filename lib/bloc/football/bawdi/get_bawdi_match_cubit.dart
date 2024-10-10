import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/repository/bawdi_repo.dart';

part 'get_bawdi_match_state.dart';

class GetBawdiMatchCubit extends Cubit<GetBawdiMatchState> {
  final BawdiRepo bawdiRepo;
  GetBawdiMatchCubit(this.bawdiRepo) : super(GetBawdiMatchInitial());

  void getBawdiMatch() {
    emit(GetBawdiMatchLoading());
    bawdiRepo
        .getAllBawdiMatch(DateTime.now().millisecondsSinceEpoch,
            DateTime.now().millisecondsSinceEpoch)
        .then((responseModel) {
      if (responseModel.msgState == MsgState.data) {
        List<SoccerModel> bawDiList = (responseModel.data['list'] as List)
            .map((e) => SoccerModel.fromJson(e))
            .toList();
        emit(GetBawdiMatchSuccess(bawDiList));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(GetBawdiMatchFail(error));
      }
    });
  }
}
