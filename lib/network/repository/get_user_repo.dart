import '../../models/response_model.dart';
import '../api_service.dart';

abstract class GetUserRepo {
  Future<ResponseModel> getUser();
}

class GetUserRepoImpl implements GetUserRepo {
  final ApiService apiService;
  GetUserRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getUser() async {
    return await apiService.getReq("me");
  }
}
