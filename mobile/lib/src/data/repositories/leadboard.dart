import 'package:flutter/material.dart';
import 'package:mobile/src/data/models/leaderboard.dart';
import 'package:mobile/src/data/service/leaderboard.dart';

class Leadboardrepo {
  final Leaderboardservice service;

  Leadboardrepo(this.service);

  Future<List<Leaderboardmodel>> getleaderboard() {
    debugPrint("getleaderboard");
    if (service.fetchLeaderboard() != null) {
      return service.fetchLeaderboard();
    }
    else{
      debugPrint("null");
      return  service.fetchLeaderboard();}
  }
}
