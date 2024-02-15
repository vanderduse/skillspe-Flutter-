class TournamentsListResponse {
  String? id;
  String? title;
  List<Matches>? matches;
  String? bannerImage;

  TournamentsListResponse(
      {this.id, this.title, this.matches, this.bannerImage});

  TournamentsListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bannerImage = json['banner_image'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['banner_image'] = bannerImage;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  String? id;
  String? startTime;
  List<Teams>? teams;

  Matches({this.id, this.startTime, this.teams});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_time'] = startTime;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  String? teamName;
  String? teamAccent;
  String? tournamentId;
  String? group;

  Teams({this.teamName, this.teamAccent, this.tournamentId, this.group});

  Teams.fromJson(Map<String, dynamic> json) {
    teamName = json['team_name'];
    teamAccent = json['team_accent'];
    tournamentId = json['tournament_id'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_name'] = teamName;
    data['team_accent'] = teamAccent;
    data['tournament_id'] = tournamentId;
    data['group'] = group;
    return data;
  }
}
