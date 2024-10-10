import 'package:two_d/models/response_model.dart';

import '../api_service.dart';

abstract class CheckAppUpdateRepo {
  Future<ResponseModel> check();
}

class CheckAppUpdateRepoImpl implements CheckAppUpdateRepo {
  final ApiService apiService;
  CheckAppUpdateRepoImpl(this.apiService);

  @override
  Future<ResponseModel> check() async {
    return await apiService
        .checkAppUpdate('https://wordpress.savelinks.xyz/index.php');
  }
}
