import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/models/soccer_bet_model.dart';
import 'package:two_d/network/repository/soccer_bet_repo.dart';

part 'soccer_bet_state.dart';

class SoccerBetCubit extends Cubit<SoccerBetState> {
  final SoccerBetRepo repo;
  SoccerBetCubit(this.repo) : super(SoccerBetInitial());

  void bet(SoccerBetModel betBody) {
    emit(SoccerBetLoading());
    repo.bet(betBody: betBody).then((value) {
      if (value.msgState == MsgState.error) {
        emit(SoccerBetFail(value.data));
        print("Printing Event: ${value.msgState}");
      } else {
        emit(SoccerBetSuccess());
      }
    }).catchError((e) => emit(SoccerBetFail(e.toString())));
  }
}
