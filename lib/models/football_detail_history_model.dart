/*class FootballDetailHistoryModel {
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
}*/

/*
class FootballDetailHistoryModel {
      int? id;
      int? soccerBetId;
      int? gameId;
      Game? game;
      int? betTeamId;
      HomeTeam? betTeam;
      bool? betUnder;
      String? underTeam;

      FootballDetailHistoryModel(
          {this.id,
                this.soccerBetId,
                this.gameId,
                this.game,
                this.betTeamId,
                this.betTeam,
                this.betUnder,
                this.underTeam});

      FootballDetailHistoryModel.fromJson(Map<String, dynamic> json) {
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
*/

class FootballDetailHistoryModel {
      final int id;
      final int soccerBetId;
      final int gameId;
      final Game game;
      final int betTeamId;
      final BetTeam betTeam;
      final bool betUnder;
      final String underTeam;
      final double amount;

      FootballDetailHistoryModel({
            required this.id,
            required this.soccerBetId,
            required this.gameId,
            required this.game,
            required this.betTeamId,
            required this.betTeam,
            required this.betUnder,
            required this.underTeam,
            required this.amount,
      });

      factory FootballDetailHistoryModel.fromJson(Map<String, dynamic> json) {
            return FootballDetailHistoryModel(
                  id: json['id'],
                  soccerBetId: json['soccerBetId'],
                  gameId: json['gameId'],
                  game: Game.fromJson(json['game']),
                  betTeamId: json['betTeamId'],
                  betTeam: BetTeam.fromJson(json['betTeam']),
                  betUnder: json['betUnder'],
                  underTeam: json['underTeam'],
                  amount: json['amount'],
            );
      }
}

class Game {
      final int id;
      final String token;
      final String type;
      final int leagueGroupId;
      final String leagueGroupName;
      final int homeTeamId;
      final Team homeTeam;
      final int awayTeamId;
      final Team awayTeam;
      final String homeBet;
      final String awayBet;
      final int startDateInMilliSeconds;
      final int endDateInMilliSeconds;
      final String gp;
      final bool betOpen;
      final bool gameOpen;
      final bool liveOpen;
      final String status;
      final int createdDateInMilliSeconds;
      final int updatedDateInMilliSeconds;
      final bool matchClone;

      Game({
            required this.id,
            required this.token,
            required this.type,
            required this.leagueGroupId,
            required this.leagueGroupName,
            required this.homeTeamId,
            required this.homeTeam,
            required this.awayTeamId,
            required this.awayTeam,
            required this.homeBet,
            required this.awayBet,
            required this.startDateInMilliSeconds,
            required this.endDateInMilliSeconds,
            required this.gp,
            required this.betOpen,
            required this.gameOpen,
            required this.liveOpen,
            required this.status,
            required this.createdDateInMilliSeconds,
            required this.updatedDateInMilliSeconds,
            required this.matchClone,
      });

      factory Game.fromJson(Map<String, dynamic> json) {
            return Game(
                  id: json['id'],
                  token: json['token'],
                  type: json['type'],
                  leagueGroupId: json['leagueGroupId'],
                  leagueGroupName: json['leagueGroupName'],
                  homeTeamId: json['homeTeamId'],
                  homeTeam: Team.fromJson(json['homeTeam']),
                  awayTeamId: json['awayTeamId'],
                  awayTeam: Team.fromJson(json['awayTeam']),
                  homeBet: json['homeBet'] ?? "",
                  awayBet: json['awayBet'] ?? "",
                  startDateInMilliSeconds: json['startDateInMilliSeconds'],
                  endDateInMilliSeconds: json['endDateInMilliSeconds'],
                  gp: json['gp'],
                  betOpen: json['betOpen'],
                  gameOpen: json['gameOpen'],
                  liveOpen: json['liveOpen'],
                  status: json['status'],
                  createdDateInMilliSeconds: json['createdDateInMilliSeconds'],
                  updatedDateInMilliSeconds: json['updatedDateInMilliSeconds'],
                  matchClone: json['matchClone'],
            );
      }
}

class Team {
      final int id;
      final String nameInMM;
      final String nameInEng;
      final int createdDateInMilliSeconds;
      final int updatedDateInMilliSeconds;

      Team({
            required this.id,
            required this.nameInMM,
            required this.nameInEng,
            required this.createdDateInMilliSeconds,
            required this.updatedDateInMilliSeconds,
      });

      factory Team.fromJson(Map<String, dynamic> json) {
            return Team(
                  id: json['id'],
                  nameInMM: json['nameInMM'],
                  nameInEng: json['nameInEng'],
                  createdDateInMilliSeconds: json['createdDateInMilliSeconds'],
                  updatedDateInMilliSeconds: json['updatedDateInMilliSeconds'],
            );
      }
}

class BetTeam {
      final int id;
      final String nameInMM;
      final String nameInEng;
      final int createdDateInMilliSeconds;
      final int updatedDateInMilliSeconds;

      BetTeam({
            required this.id,
            required this.nameInMM,
            required this.nameInEng,
            required this.createdDateInMilliSeconds,
            required this.updatedDateInMilliSeconds,
      });

      factory BetTeam.fromJson(Map<String, dynamic> json) {
            return BetTeam(
                  id: json['id'],
                  nameInMM: json['nameInMM'],
                  nameInEng: json['nameInEng'],
                  createdDateInMilliSeconds: json['createdDateInMilliSeconds'],
                  updatedDateInMilliSeconds: json['updatedDateInMilliSeconds'],
            );
      }
}

