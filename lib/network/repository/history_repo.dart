import '../../models/response_model.dart';
import '../api_service.dart';

abstract class GetHistoryRepo {
  Future<ResponseModel> getHistory({required String type,required int page});
}

class GetHistoryRepoImpl implements GetHistoryRepo {
  final ApiService apiService;
  GetHistoryRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getHistory({required String type,required int page}) async {
    return await apiService.getReq("all-bets?fromDate=&toDate=&username=&token=&gameType=$type&status=&page=$page&size&sort");
  }
}
