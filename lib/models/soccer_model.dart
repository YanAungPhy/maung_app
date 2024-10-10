class SoccerModel {
  final int id;
  final String token;
  final String type;
  final int leagueGroupId;
  final String leagueGroupName;
  final int homeTeamId;
  final TeamModel homeTeam;
  final int awayTeamId;
  final TeamModel awayTeam;
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

  SoccerModel({
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

  factory SoccerModel.fromJson(Map<String, dynamic> json) {
    return SoccerModel(
      id: json['id'],
      token: json['token'],
      type: json['type'],
      leagueGroupId: json['leagueGroupId'],
      leagueGroupName: json['leagueGroupName'],
      homeTeamId: json['homeTeamId'],
      homeTeam: TeamModel.fromJson(json['homeTeam']),
      awayTeamId: json['awayTeamId'],
      awayTeam: TeamModel.fromJson(json['awayTeam']),
      homeBet: json['homeBet'],
      awayBet: json['awayBet'],
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

class TeamModel {
  final int id;
  final String nameInMM;
  final String nameInEng;
  final String? leagueLogoUrl;
  final int createdDateInMilliSeconds;
  final int updatedDateInMilliSeconds;

  TeamModel({
    required this.id,
    required this.nameInMM,
    required this.nameInEng,
    this.leagueLogoUrl,
    required this.createdDateInMilliSeconds,
    required this.updatedDateInMilliSeconds,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'],
      nameInMM: json['nameInMM'],
      nameInEng: json['nameInEng'],
      leagueLogoUrl: json['leagueLogoUrl'],
      createdDateInMilliSeconds: json['createdDateInMilliSeconds'],
      updatedDateInMilliSeconds: json['updatedDateInMilliSeconds'],
    );
  }
}
