class SoccerBetModel {
  String gameType;
  int amount;
  List<SoccerBetDetailModel> soccerBetDetails;

  SoccerBetModel({
    required this.gameType,
    required this.amount,
    required this.soccerBetDetails,
  });

  factory SoccerBetModel.fromJson(Map<String, dynamic> json) {
    return SoccerBetModel(
      gameType: json['gameType'],
      amount: json['amount'],
      soccerBetDetails: (json['soccerBetDetails'] as List<dynamic>)
          .map((detail) => SoccerBetDetailModel.fromJson(detail))
          .toList(),
    );
  }

  SoccerBetModel copyWith({
    String? gameType,
    int? amount,
    List<SoccerBetDetailModel>? soccerBetDetails,
  }) {
    return SoccerBetModel(
      gameType: gameType ?? this.gameType,
      amount: amount ?? this.amount,
      soccerBetDetails: soccerBetDetails ?? this.soccerBetDetails,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameType': gameType,
      'amount': amount,
      'soccerBetDetails':
          soccerBetDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}

class SoccerBetDetailModel {
  int gameId;
  int betTeamId;
  String? betUnder;

  SoccerBetDetailModel({
    required this.gameId,
    required this.betTeamId,
    required this.betUnder,
  });

  factory SoccerBetDetailModel.fromJson(Map<String, dynamic> json) {
    return SoccerBetDetailModel(
      gameId: json['gameId'],
      betTeamId: json['betTeamId'],
      betUnder: json['betUnder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'betTeamId': betTeamId,
      'betUnder': betUnder,
    };
  }
}


