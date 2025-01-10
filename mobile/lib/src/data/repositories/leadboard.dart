import 'package:mobile/src/data/models/leaderboard.dart';
import 'package:mobile/src/data/service/leaderboard.dart';

class Leadboardrepo {
  final Leaderboardservice service;

  Leadboardrepo(this.service);

  Future<List<Leaderboardmodel>> getleaderboard() {
    return service.fetchLeaderboard();
  }
}
