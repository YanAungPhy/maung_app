import 'package:two_d/models/soccer_bet_model.dart';

import '../../models/bet_body_model.dart';
import '../../models/response_model.dart';
import '../api_service.dart';

class SoccerBetRepo {
  final ApiService apiService;
  SoccerBetRepo(this.apiService);

  Future<ResponseModel> bet({required SoccerBetModel betBody}) async {
    return await apiService.postReq(
      "soccer-bet",
      mapParam: betBody.toJson(),
    );
  }
}
