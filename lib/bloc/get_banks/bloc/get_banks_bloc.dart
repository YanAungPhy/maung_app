import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/bank_model.dart';
import 'package:two_d/models/response_model.dart';

import '../../../network/repository/banks_repo.dart';

part 'get_banks_event.dart';
part 'get_banks_state.dart';

class GetBanksBloc extends Bloc<GetBanksEvent, GetBanksState> {
  final BanksRepoImpl _banksRepoImpl;
  GetBanksBloc(this._banksRepoImpl) : super(GetBanksInitial()) {
    on<GetBanksEvent>((event, emit) {});
    on<TapGetBanksEvent>((event, emit) async {
      emit(GetBanksLoading());
      ResponseModel responseModel = await _banksRepoImpl.getBanks();
      if (responseModel.msgState == MsgState.data) {
        List<BankModel> banksmodelList = (responseModel.data as List)
            .map((e) => BankModel.fromJson(e))
            .toList();
        emit(GetBanksSuccess(banksmodelList: banksmodelList));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(GetBanksFail(error: error));
      }
    });
  }
}
