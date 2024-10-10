import 'package:two_d/models/BodySoccerBetModel.dart';
import '../../models/response_model.dart';
import 'api_service.dart';

class BodySoccerBetRepo {
  final ApiService apiService;
  BodySoccerBetRepo(this.apiService);

  Future<ResponseModel> bet({required BodySoccerBetModel betBody}) async {
    return await apiService.postReq(
      "soccer-bet",
      mapParam: betBody.toJson(),
    );
  }
}
