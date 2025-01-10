import 'package:mobile/src/data/models/leaderboard.dart';
import 'package:flutter/material.dart';
class Leaderboardservice {
  //if theres no connection fetch from the db else fetch from the api
   Future<List<Leaderboardmodel>> fetchLeaderboard() async {
    debugPrint("fetchLeaderboard");
    await Future.delayed(Duration(seconds: 2));
    debugPrint("fetchLeaderboard waiting 2 ");

    List<Map<String, dynamic>> simulatedData = [
      {
        "name": "John Doe",
        "score": 1000,
        "classement": 1,
      },
      {
        "name": "Jane Smith",
        "score": 950,
        "classement": 2,
      },
      {
        "name": "Bob Brown",
        "score": 900,
        "classement": 3,
      },
      {
        "name": "Alice Johnson",
        "score": 850,
        "classement": 4,
      },
      {
        "name": "Charlie Davis",
        "score": 800,
        "classement": 5,
      },
    ];

    List<Leaderboardmodel> leaderboard = simulatedData
        .map((data) => Leaderboardmodel.fromJson(data))
        .toList();

    leaderboard.sort((a, b) => b.score.compareTo(a.score));

 
    
    return leaderboard;
  }


  }
