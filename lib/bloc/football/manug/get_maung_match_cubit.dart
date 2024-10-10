import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/network/repository/maung_repo.dart';

part 'get_maung_match_state.dart';

class GetMaungMatchCubit extends Cubit<GetMaungMatchState> {
  final MaungRepo maungRepo;
  GetMaungMatchCubit(this.maungRepo) : super(GetMaungMatchInitial());

  void getMaungMatch() {
    emit(GetMaungMatchLoading());
    maungRepo
        .getAllMaungMatch(DateTime.now().millisecondsSinceEpoch,
            DateTime.now().millisecondsSinceEpoch)
        .then((responseModel) {
      if (responseModel.msgState == MsgState.data) {
        List<SoccerModel> bawDiList = (responseModel.data['list'] as List)
            .map((e) => SoccerModel.fromJson(e))
            .toList();
        emit(GetMaungMatchSuccess(bawDiList));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(GetMaungMatchFail(error));
      }
    });
  }
}
