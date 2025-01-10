import 'package:flutter/material.dart';
import 'package:mobile/src/data/models/leaderboard.dart';
import 'package:mobile/src/data/repositories/leadboard.dart';

class Leaderboarddomain {
  final Leadboardrepo leadboardrepo;
  Leaderboarddomain(this.leadboardrepo, );

  Future<List<Leaderboardmodel>> getleaderboard() {
    debugPrint("tbhrt");
  if( leadboardrepo.getleaderboard()!=null){
    return leadboardrepo.getleaderboard();
  }
  else{
    debugPrint("null");
    return  leadboardrepo.getleaderboard();
  }
    
  }
    
  }
