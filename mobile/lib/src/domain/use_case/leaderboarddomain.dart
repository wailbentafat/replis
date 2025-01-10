import 'package:mobile/src/data/models/leaderboard.dart';
import 'package:mobile/src/data/repositories/leadboard.dart';

class Leaderboarddomain {
  final Leadboardrepo leadboardrepo;
  Leaderboarddomain(this.leadboardrepo);

  Future<List<Leaderboardmodel>> getleaderboard() {
    return leadboardrepo.getleaderboard();
  }
}