import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/trans_history_model.dart';

import '../../../models/response_model.dart';
import '../../../network/repository/transaction_history_repo.dart';

part 'transacion_history_event.dart';
part 'transacion_history_state.dart';

class TransacionHistoryBloc
    extends Bloc<TransacionHistoryEvent, TransacionHistoryState> {
  final TransactionHistoryRepoImpl _transactionHistoryRepoImpl;
  int page = 0;
  TransacionHistoryBloc(this._transactionHistoryRepoImpl)
      : super(TransacionHistoryInitial()) {
    on<TransacionHistoryEvent>((event, emit) {});
    on<TapTransactionHistoryEvent>(
      (event, emit) async {
         page = 0;
        ResponseModel responseModel =
            await _transactionHistoryRepoImpl.getTransactionHistory(page: page);
        if (responseModel.msgState == MsgState.data) {
          List<TransHistoryModel> transHistoryModelList =
              (responseModel.data["list"] as List)
                  .map((e) => TransHistoryModel.fromJson(e))
                  .toList();
          emit(TransacionHistorySuccess(
              transHistoryModelList: transHistoryModelList, isFirst: true));
        } else if (responseModel.msgState == MsgState.error) {
          String error = responseModel.data;
          emit(TransacionHistoryFail(error: error));
        }
      },
    );
    on<TapTransactionHistoryMoreEvent>(
      (event, emit) async {
        page++;
        ResponseModel responseModel =
            await _transactionHistoryRepoImpl.getTransactionHistory(page: page);
        if (responseModel.msgState == MsgState.data) {
          List<TransHistoryModel> transHistoryModelList =
              (responseModel.data["list"] as List)
                  .map((e) => TransHistoryModel.fromJson(e))
                  .toList();
          if (transHistoryModelList.isNotEmpty) {
            emit(TransacionHistorySuccess(
                transHistoryModelList: transHistoryModelList, isFirst: false));
          } else {
            emit(TransacionHistoryNoMore());
          }
        } else if (responseModel.msgState == MsgState.error) {
          String error = responseModel.data;
          emit(TransacionHistoryFail(error: error));
        }
      },
    );
  }
}
