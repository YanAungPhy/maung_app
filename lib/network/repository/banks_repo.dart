import '../../models/response_model.dart';
import '../api_service.dart';

abstract class BanksRepo {
  Future<ResponseModel> getBanks();
}

class BanksRepoImpl implements BanksRepo {
  final ApiService apiService;
  BanksRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getBanks() async {
    return await apiService.getReq("payment-method");
  }
}
