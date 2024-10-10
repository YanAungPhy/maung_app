import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/response_model.dart';
import '../../../network/repository/balance_transation_repo.dart';

part 'balance_transation_event.dart';
part 'balance_transation_state.dart';

class BalanceTransationBloc
    extends Bloc<BalanceTransationEvent, BalanceTransationState> {
  final BalanceTransationRepoImpl _balanceTransationRepoImpl;
  BalanceTransationBloc(this._balanceTransationRepoImpl)
      : super(BalanceTransationInitial()) {
    on<BalanceTransationEvent>((event, emit) {});
    on<TapBalanceTransationEvent>((event, emit) async {
      emit(BalanceTransationLoading());

      final Map<String, dynamic> transationDetail = event.transationDetail;

      ResponseModel responseModel = await _balanceTransationRepoImpl
          .postTransation(mapParam: transationDetail);

      if (responseModel.msgState == MsgState.data) {
        emit(BalanceTransationSuccess());
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(BalanceTransationFail(error: error));
      }
    });
  }
}
