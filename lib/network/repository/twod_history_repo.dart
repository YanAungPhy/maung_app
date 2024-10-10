import '../../models/response_model.dart';
import '../api_service.dart';

abstract class TwoDHistoryRepo {
  Future<ResponseModel> getResultHistory();
}

class TwoDHistoryRepoImpl implements TwoDHistoryRepo {
  final ApiService apiService;
  TwoDHistoryRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getResultHistory() async {
    return await apiService.getWinNum('https://api.2dboss.com/api/v2/v1/bkk/twod-result');
  }
}
