import 'package:flutter/material.dart';
import 'package:mobile/src/data/models/leaderboard.dart';
import 'package:mobile/src/domain/use_case/leaderboarddomain.dart';

class LeaderbaordView extends ChangeNotifier {
  final Leaderboarddomain leadboarddomain;

  List<Leaderboardmodel> leaderboard = [];
  bool isLoading = false;
  String error = '';
  LeaderbaordView(this.leadboarddomain);
  Future<void> getleaderboard() async {
     bool isloading = true;
    notifyListeners();
    try {
      leaderboard = await leadboarddomain.getleaderboard();
      isloading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isloading = false;
      notifyListeners();
    }
    

    

  }
}
