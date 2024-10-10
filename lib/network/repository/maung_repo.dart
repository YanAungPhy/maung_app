import 'package:dio/dio.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/api_service.dart';

class MaungRepo {
  final ApiService apiService;
  MaungRepo(this.apiService);

  Future<ResponseModel> getAllMaungMatch(
      int fromDateMilli, int toDateMilli) async {
    return apiService
        .dioReq(RequestType.get, endPoint: 'soccer-games', mapParam: {
      // 'fromDate': fromDateMilli,
      // 'toDate': toDateMilli,
      'type': "Maung"
    });
  }
}
