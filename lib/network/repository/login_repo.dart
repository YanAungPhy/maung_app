import 'package:dio/src/form_data.dart';
import 'package:http/http.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/locator.dart';

import '../api_service.dart';

abstract class LoginRepo {
  Future<ResponseModel> login(
      {required String phone, required String password});
}

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;
  LoginRepoImpl(this.apiService);

  @override
  Future<ResponseModel> login(
      {required String phone, required String password}) async {
    return await apiService.postReq(
      "auth/login",
      mapParam: {"secretName": phone, "password": password},
    );
  }
}
