import 'package:bloc/bloc.dart';
import 'package:two_d/models/BodySoccerBetModel.dart';
import 'package:two_d/models/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../network/body_soccer_bet_repo.dart';

part 'body_soccer_bet_state.dart';

class BodySoccerBetCubit extends Cubit<BodySoccerBetState> {
  final BodySoccerBetRepo repo;
  BodySoccerBetCubit(this.repo) : super(BodySoccerBetInitial());

  void bet(BodySoccerBetModel betBody) {
    emit(BodySoccerBetLoading());
    repo.bet(betBody: betBody).then((value) {
      if (value.msgState == MsgState.error) {
        emit(BodySoccerBetFail(value.data));
        print("Printing Event: ${value.msgState}");
      } else {
        emit(BodySoccerBetSuccess());
      }
    }).catchError((e) => emit(BodySoccerBetFail(e.toString())));
  }
}
