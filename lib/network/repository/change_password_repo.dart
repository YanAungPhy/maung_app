import 'package:dio/src/form_data.dart';
import 'package:http/http.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/locator.dart';

import '../api_service.dart';

abstract class ChangePasswordRepo {
  Future<ResponseModel> changePassword(
      {required String oldPassword, required String newPassword});
}

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ApiService apiService;
  ChangePasswordRepoImpl(this.apiService);

  @override
  Future<ResponseModel> changePassword(
      {required String oldPassword, required String newPassword}) async {
    return await apiService.putReq(
      "change-password",
      mapParam: {"oldPassword": oldPassword, "newPassword": newPassword},
    );
  }
}
