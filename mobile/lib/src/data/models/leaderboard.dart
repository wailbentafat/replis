class Leaderboardmodel {
  final String name;
  final int score;
  final int classement;

  Leaderboardmodel({required this.name, required this.score, required this.classement});
  factory Leaderboardmodel.fromJson(Map<String, dynamic> json) {
    return Leaderboardmodel(
      name: json['name'],
      score: json['score'],
      classement: json['classement'],
    );
  }


}
