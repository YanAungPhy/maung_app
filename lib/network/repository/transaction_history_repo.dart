import '../../models/response_model.dart';
import '../api_service.dart';

abstract class TransactionHistoryRepo {
  Future<ResponseModel> getTransactionHistory({required int page});
}

class TransactionHistoryRepoImpl implements TransactionHistoryRepo {
  final ApiService apiService;
  TransactionHistoryRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getTransactionHistory({required int page}) async {
    return await apiService.getReq(
        "balance-transaction?type=&paymentMethodId=&status=&username=&fromDate=&toDate=&page=$page&size&sort");
  }
}
