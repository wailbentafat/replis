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
    isLoading = true;
    notifyListeners();
    try {
      leaderboard = await leadboarddomain.getleaderboard();
      isLoading = false; 
    } catch (e) {
      error = e.toString();
      isLoading = false;
      print(
          'Error fetching leaderboard: $error'); 
    }

    notifyListeners();
  }
}
