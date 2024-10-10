import '../../models/response_model.dart';
import '../api_service.dart';

abstract class FootballGetHistoryRepo {
  Future<ResponseModel> getHistory({required String type,required int page});
}

class FootballGetHistoryRepoImpl implements FootballGetHistoryRepo {
  final ApiService apiService;
  FootballGetHistoryRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getHistory({required String type,required int page}) async {
    return await apiService.getReq("soccer-bets?token");
  }
}
