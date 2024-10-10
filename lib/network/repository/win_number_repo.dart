import '../../models/response_model.dart';
import '../api_service.dart';

abstract class WinNumRepo {
  Future<ResponseModel> getWinNum();
}

class WinNumRepoImpl implements WinNumRepo {
  final ApiService apiService;
  WinNumRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getWinNum() async {
    return await apiService.getWinNum('https://luke.2dboss.com/api/luke/twod-result-live');
  }
}
