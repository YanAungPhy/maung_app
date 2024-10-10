import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';

import '../../../models/bet_body_model.dart';
import '../../../network/repository/betRepo.dart';

part 'bet_event.dart';
part 'bet_state.dart';

class BetBloc extends Bloc<BetEvent, BetState> {
  final BetRepoImpl _betRepoImpl;
  BetBloc(this._betRepoImpl) : super(BetInitial()) {
    on<BetEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TapBetEvent>((event, emit) async {
      emit(BetLoading());
      BetBody betBody = event.betBody;
      ResponseModel responseModel = await _betRepoImpl.bet(betBody: betBody);
      if (responseModel.msgState == MsgState.data) {
        emit(BetSuccess());
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(BetFail(error: error));
      }
    });
  }
}
