import '../../models/response_model.dart';
import '../api_service.dart';

abstract class RefreshTokenRepo {
  Future<ResponseModel> refreshToken({required String refreshToken});
}

class RefreshTokenRepoImpl implements RefreshTokenRepo {
  final ApiService apiService;
  RefreshTokenRepoImpl(this.apiService);

  @override
  Future<ResponseModel> refreshToken({required String refreshToken}) async {
    return await apiService.getReq("auth/refresh-token/$refreshToken");
  }
}
