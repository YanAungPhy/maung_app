import '../../models/response_model.dart';
import '../api_service.dart';

abstract class BalanceTransationRepo {
  Future<ResponseModel> postTransation(
      {required Map<String, dynamic> mapParam});
}

class BalanceTransationRepoImpl implements BalanceTransationRepo {
  final ApiService apiService;
  BalanceTransationRepoImpl(this.apiService);

  @override
  Future<ResponseModel> postTransation(
      {required Map<String, dynamic> mapParam}) async {
    return await apiService.postReq(
      "balance-transaction",
      mapParam: mapParam,
    );
  }
}
