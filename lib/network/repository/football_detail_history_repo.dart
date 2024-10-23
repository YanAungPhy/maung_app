import '../../models/response_model.dart';
import '../api_service.dart';

abstract class FootballDetailGetHistoryRepo {
  Future<ResponseModel> getDetailHistory({required int historyId});
}

class FootballDetailGetHistoryRepoImpl implements FootballDetailGetHistoryRepo {
  final ApiService apiService;
  FootballDetailGetHistoryRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getDetailHistory({required int historyId}) async {
    return await apiService.getReq(
        "soccer-bet?token",);
  }
}
