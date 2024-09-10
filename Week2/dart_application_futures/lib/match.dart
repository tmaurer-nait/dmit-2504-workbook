class Match {
  // Properties of the Match Class
  late String team1Name;
  late String team2Name;
  late int scoreOne;
  late int scoreTwo;

  Match(
      {required this.team1Name,
      required this.team2Name,
      required this.scoreOne,
      required this.scoreTwo});

  // Factory that turns dynamic json object into Match class instance
  factory Match.fromJSON(dynamic jsonMatch) {
    return Match(
        team1Name: jsonMatch['team_1_name'],
        team2Name: jsonMatch['team_2_name'],
        scoreOne: jsonMatch['score_one'],
        scoreTwo: jsonMatch['score_two']);
  }
}
