import '../../models/bet_body_model.dart';
import '../../models/response_model.dart';
import '../api_service.dart';

abstract class BetRepo {
  Future<ResponseModel> bet({required BetBody betBody});
}

class BetRepoImpl implements BetRepo {
  final ApiService apiService;
  BetRepoImpl(this.apiService);

  @override
  Future<ResponseModel> bet({required BetBody betBody}) async {
    List<Map<String, dynamic>> betDetailList = betBody.betDetails.map((e) {
      return {"amount": e.amount, "digit": e.digit};
    }).toList();

    Map<String, dynamic> postMap = {
      "gameType": betBody.gameType,
      "betDetails": betDetailList
    };
    return await apiService.postReq(
      "bet",
      mapParam: postMap,
    );
  }
}
