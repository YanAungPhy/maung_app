import 'package:dio/src/form_data.dart';
import 'package:http/http.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/locator.dart';

import '../api_service.dart';

abstract class SingUpRepo {
  Future<ResponseModel> singup(
      {required String phone, required String password, required String name});
}

class SingUpRepoImpl implements SingUpRepo {
  final ApiService apiService;
  SingUpRepoImpl(this.apiService);

  @override
  Future<ResponseModel> singup(
      {required String phone,
      required String password,
      required String name}) async {
    return await apiService.postReq(
      "auth/signup",
      mapParam: {
        "name": name,
        "secretName": phone,
        "password": password,
        "phoneNo": phone
      },
    );
  }
}
