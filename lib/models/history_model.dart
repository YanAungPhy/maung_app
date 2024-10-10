class HistoryModel {
  int? id;
  int? userId;
  String? username;
  String? token;
  String? gameType;
  String? status;
  int? createdDateInMilliSeconds;
  int? announcementId;
  List<BetDetails>? betDetails;

  HistoryModel(
      {this.id,
      this.userId,
      this.username,
      this.token,
      this.gameType,
      this.status,
      this.createdDateInMilliSeconds,
      this.announcementId,
      this.betDetails});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    username = json['username'];
    token = json['token'];
    gameType = json['gameType'];
    status = json['status'];
    createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
    announcementId = json['announcementId'];
    if (json['betDetails'] != null) {
      betDetails = <BetDetails>[];
      json['betDetails'].forEach((v) {
        betDetails!.add(new BetDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['token'] = this.token;
    data['gameType'] = this.gameType;
    data['status'] = this.status;
    data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
    data['announcementId'] = this.announcementId;
    if (this.betDetails != null) {
      data['betDetails'] = this.betDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BetDetails {
  int? id;
  String? digit;
  String? amount;
  bool? isWin;

  BetDetails({this.id, this.digit, this.amount, this.isWin});

  BetDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digit = json['digit'];
    amount = json['amount'].toString();
    isWin = json['isWin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digit'] = this.digit;
    data['amount'] = this.amount;
    data['isWin'] = this.isWin;
    return data;
  }
}
