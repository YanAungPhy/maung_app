import 'package:dio/dio.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/api_service.dart';

class BawdiRepo {
  final ApiService apiService;
  BawdiRepo(this.apiService);

  Future<ResponseModel> getAllBawdiMatch(
      int fromDateMilli, int toDateMilli) async {
    return apiService
        .dioReq(RequestType.get, endPoint: 'soccer-games', mapParam: {
      // 'fromDate': fromDateMilli,
      // 'toDate': toDateMilli,
      'type': "Body"
    });
  }
}
