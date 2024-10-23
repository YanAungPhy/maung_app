class FootballDetailHistoryModel {
int? id;
String? token;
int? userId;
String? userName;
String? gameType;
int? amount;
String? status;
int? createdDateInMilliSeconds;
int? updatedDateInMilliSeconds;
List<SoccerBetDetails>? soccerBetDetails;

FootballDetailHistoryModel(
    {this.id,
      this.token,
      this.userId,
      this.userName,
      this.gameType,
      this.amount,
      this.status,
      this.createdDateInMilliSeconds,
      this.updatedDateInMilliSeconds,
      this.soccerBetDetails});

FootballDetailHistoryModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
token = json['token'];
userId = json['userId'];
userName = json['userName'];
gameType = json['gameType'];
amount = json['amount'];
status = json['status'];
createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
if (json['soccerBetDetails'] != null) {
soccerBetDetails = <SoccerBetDetails>[];
json['soccerBetDetails'].forEach((v) {
soccerBetDetails!.add(new SoccerBetDetails.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['token'] = this.token;
data['userId'] = this.userId;
data['userName'] = this.userName;
data['gameType'] = this.gameType;
data['amount'] = this.amount;
data['status'] = this.status;
data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
data['updatedDateInMilliSeconds'] = this.updatedDateInMilliSeconds;
if (this.soccerBetDetails != null) {
data['soccerBetDetails'] =
this.soccerBetDetails!.map((v) => v.toJson()).toList();
}
return data;
}
}

class SoccerBetDetails {
int? id;
int? soccerBetId;
int? gameId;
Game? game;
int? betTeamId;
HomeTeam? betTeam;
bool? betUnder;
String? underTeam;

SoccerBetDetails(
{this.id,
this.soccerBetId,
this.gameId,
this.game,
this.betTeamId,
this.betTeam,
this.betUnder,
this.underTeam});

SoccerBetDetails.fromJson(Map<String, dynamic> json) {
id = json['id'];
soccerBetId = json['soccerBetId'];
gameId = json['gameId'];
game = json['game'] != null ? new Game.fromJson(json['game']) : null;
betTeamId = json['betTeamId'];
betTeam =
json['betTeam'] != null ? new HomeTeam.fromJson(json['betTeam']) : null;
betUnder = json['betUnder'];
underTeam = json['underTeam'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['soccerBetId'] = this.soccerBetId;
data['gameId'] = this.gameId;
if (this.game != null) {
data['game'] = this.game!.toJson();
}
data['betTeamId'] = this.betTeamId;
if (this.betTeam != null) {
data['betTeam'] = this.betTeam!.toJson();
}
data['betUnder'] = this.betUnder;
data['underTeam'] = this.underTeam;
return data;
}
}

class Game {
int? id;
String? token;
String? type;
int? leagueGroupId;
String? leagueGroupName;
int? homeTeamId;
HomeTeam? homeTeam;
int? awayTeamId;
HomeTeam? awayTeam;
String? homeBet;
String? awayBet;
int? startDateInMilliSeconds;
int? endDateInMilliSeconds;
String? gp;
bool? betOpen;
bool? gameOpen;
bool? liveOpen;
String? status;
int? createdDateInMilliSeconds;
int? updatedDateInMilliSeconds;
bool? matchClone;

Game(
{this.id,
this.token,
this.type,
this.leagueGroupId,
this.leagueGroupName,
this.homeTeamId,
this.homeTeam,
this.awayTeamId,
this.awayTeam,
this.homeBet,
this.awayBet,
this.startDateInMilliSeconds,
this.endDateInMilliSeconds,
this.gp,
this.betOpen,
this.gameOpen,
this.liveOpen,
this.status,
this.createdDateInMilliSeconds,
this.updatedDateInMilliSeconds,
this.matchClone});

Game.fromJson(Map<String, dynamic> json) {
id = json['id'];
token = json['token'];
type = json['type'];
leagueGroupId = json['leagueGroupId'];
leagueGroupName = json['leagueGroupName'];
homeTeamId = json['homeTeamId'];
homeTeam = json['homeTeam'] != null
? new HomeTeam.fromJson(json['homeTeam'])
    : null;
awayTeamId = json['awayTeamId'];
awayTeam = json['awayTeam'] != null
? new HomeTeam.fromJson(json['awayTeam'])
    : null;
homeBet = json['homeBet'];
awayBet = json['awayBet'];
startDateInMilliSeconds = json['startDateInMilliSeconds'];
endDateInMilliSeconds = json['endDateInMilliSeconds'];
gp = json['gp'];
betOpen = json['betOpen'];
gameOpen = json['gameOpen'];
liveOpen = json['liveOpen'];
status = json['status'];
createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
matchClone = json['matchClone'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['token'] = this.token;
data['type'] = this.type;
data['leagueGroupId'] = this.leagueGroupId;
data['leagueGroupName'] = this.leagueGroupName;
data['homeTeamId'] = this.homeTeamId;
if (this.homeTeam != null) {
data['homeTeam'] = this.homeTeam!.toJson();
}
data['awayTeamId'] = this.awayTeamId;
if (this.awayTeam != null) {
data['awayTeam'] = this.awayTeam!.toJson();
}
data['homeBet'] = this.homeBet;
data['awayBet'] = this.awayBet;
data['startDateInMilliSeconds'] = this.startDateInMilliSeconds;
data['endDateInMilliSeconds'] = this.endDateInMilliSeconds;
data['gp'] = this.gp;
data['betOpen'] = this.betOpen;
data['gameOpen'] = this.gameOpen;
data['liveOpen'] = this.liveOpen;
data['status'] = this.status;
data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
data['updatedDateInMilliSeconds'] = this.updatedDateInMilliSeconds;
data['matchClone'] = this.matchClone;
return data;
}
}

class HomeTeam {
int? id;
String? nameInMM;
String? nameInEng;
int? createdDateInMilliSeconds;
int? updatedDateInMilliSeconds;

HomeTeam(
{this.id,
this.nameInMM,
this.nameInEng,
this.createdDateInMilliSeconds,
this.updatedDateInMilliSeconds});

HomeTeam.fromJson(Map<String, dynamic> json) {
id = json['id'];
nameInMM = json['nameInMM'];
nameInEng = json['nameInEng'];
createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['nameInMM'] = this.nameInMM;
data['nameInEng'] = this.nameInEng;
data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
data['updatedDateInMilliSeconds'] = this.updatedDateInMilliSeconds;
return data;
}
}