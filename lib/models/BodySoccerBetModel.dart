// *** Yap modify code *** //

class BodySoccerBetModel {
  String gameType;
  List<BodySoccerBetDetailModel> soccerBetDetails;

  BodySoccerBetModel({
    required this.gameType,
    required this.soccerBetDetails,
  });

  factory BodySoccerBetModel.fromJson(Map<String, dynamic> json) {
    return BodySoccerBetModel(
      gameType: json['gameType'],
      soccerBetDetails: (json['soccerBetDetails'] as List<dynamic>)
          .map((detail) => BodySoccerBetDetailModel.fromJson(detail))
          .toList(),
    );
  }

  BodySoccerBetModel copyWith({
    String? gameType,
    List<BodySoccerBetDetailModel>? soccerBetDetails,
  }) {
    return BodySoccerBetModel(
      gameType: gameType ?? this.gameType,
      soccerBetDetails: soccerBetDetails ?? this.soccerBetDetails,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameType': gameType,
      'soccerBetDetails':
      soccerBetDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}

class BodySoccerBetDetailModel {
  int gameId;
  int betTeamId;
  String? betUnder;
  int? betAmount;

  BodySoccerBetDetailModel({
    required this.gameId,
    required this.betTeamId,
    required this.betUnder,
    required this.betAmount,
  });

  factory BodySoccerBetDetailModel.fromJson(Map<String, dynamic> json) {
    return BodySoccerBetDetailModel(
      gameId: json['gameId'],
      betAmount: json['amount'],
      betTeamId: json['betTeamId'],
      betUnder: json['betUnder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'amount': betAmount,
      'betTeamId': betTeamId,
      'betUnder': betUnder,
    };
  }

  // Implementation of copyWith method
  BodySoccerBetDetailModel copyWith({
    int? gameId,
    int? betTeamId,
    String? betUnder,
    int? betAmount,
  }) {
    return BodySoccerBetDetailModel(
      gameId: gameId ?? this.gameId,
      betTeamId: betTeamId ?? this.betTeamId,
      betUnder: betUnder ?? this.betUnder,
      betAmount: betAmount ?? this.betAmount,
    );
  }
}

