class FootballHistoryModel {
  List<FootballHistoryModelDetail>? list;
  int? page;
  int? size;
  int? numberofElements;
  int? totalElements;
  int? totalPages;

  FootballHistoryModel({
    this.list,
    this.page,
    this.size,
    this.numberofElements,
    this.totalElements,
    this.totalPages,
  });

  FootballHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <FootballHistoryModelDetail>[];
      json['list'].forEach((v) {
        list!.add(FootballHistoryModelDetail.fromJson(v));
      });
    }
    page = json['page'];
    size = json['size'];
    numberofElements = json['numberofElements'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['size'] = size;
    data['numberofElements'] = numberofElements;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    return data;
  }
}

class FootballHistoryModelDetail {
  int? id;
  String? token;
  int? userId;
  String? userName;
  String? gameType;
  int? amount;
  String? status;
  int? teams;
  int? createdDateInMilliSeconds;
  int? updatedDateInMilliSeconds;
  List<SoccerBetDetail>? soccerBetDetails;

  FootballHistoryModelDetail({
    this.id,
    this.token,
    this.userId,
    this.userName,
    this.gameType,
    this.amount,
    this.status,
    this.teams,
    this.createdDateInMilliSeconds,
    this.updatedDateInMilliSeconds,
    this.soccerBetDetails,
  });

  FootballHistoryModelDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    userId = json['userId'];
    userName = json['userName'];
    gameType = json['gameType'];
    amount = json['amount'];
    status = json['status'];
    teams = json['teams'];
    createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
    updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
    if (json['soccerBetDetails'] != null) {
      soccerBetDetails = <SoccerBetDetail>[];
      json['soccerBetDetails'].forEach((v) {
        soccerBetDetails!.add(SoccerBetDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['userId'] = userId;
    data['userName'] = userName;
    data['gameType'] = gameType;
    data['amount'] = amount;
    data['status'] = status;
    data['teams'] = teams;
    data['createdDateInMilliSeconds'] = createdDateInMilliSeconds;
    data['updatedDateInMilliSeconds'] = updatedDateInMilliSeconds;
    if (soccerBetDetails != null) {
      data['soccerBetDetails'] =
          soccerBetDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SoccerBetDetail {
  int? betId;
  int? matchId;
  String? betType;
  double? odds;
  bool? isWin;

  SoccerBetDetail({
    this.betId,
    this.matchId,
    this.betType,
    this.odds,
    this.isWin,
  });

  SoccerBetDetail.fromJson(Map<String, dynamic> json) {
    betId = json['betId'];
    matchId = json['matchId'];
    betType = json['betType'];
    odds = json['odds'];
    isWin = json['isWin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['betId'] = betId;
    data['matchId'] = matchId;
    data['betType'] = betType;
    data['odds'] = odds;
    data['isWin'] = isWin;
    return data;
  }
}
