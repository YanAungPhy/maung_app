import '../../models/response_model.dart';
import '../api_service.dart';

abstract class ThreeDResultRepo {
  Future<ResponseModel> getThreeDResult();
}

class ThreeDResultRepoImpl implements ThreeDResultRepo {
  final ApiService apiService;
  ThreeDResultRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getThreeDResult() async {
    return await apiService.getWinNum('https://api.2dboss.com/api/lv/threed-result');
  }
}
