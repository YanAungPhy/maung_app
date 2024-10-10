import '../../models/response_model.dart';
import '../api_service.dart';

abstract class ServicePhoneRepo {
  Future<ResponseModel> getServicePhone();
}

class ServicePhoneRepoImpl implements ServicePhoneRepo {
  final ApiService apiService;
  ServicePhoneRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getServicePhone() async {
    return await apiService.getReq("system-setting/Service_PhoneNo");
  }
}
