class BetBody {
  String gameType;
  List<BetBodyDetailsModel> betDetails;

  BetBody({required this.gameType, required this.betDetails});
}

class BetBodyDetailsModel {
  String amount;
  String digit;

  BetBodyDetailsModel({required this.amount, required this.digit});
}
