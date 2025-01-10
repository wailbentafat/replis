import 'package:flutter/material.dart';
import 'package:mobile/src/presentation/view_models/auth/leaderbaord_view.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leaderboardView = Provider.of<LeaderbaordView>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: FutureBuilder(
        future: leaderboardView.getleaderboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: leaderboardView.leaderboard.length,
              itemBuilder: (context, index) {
                final leader = leaderboardView.leaderboard[index];
                return ListTile(
                  title: Text(leader.name),
                  subtitle: Text('Score: ${leader.score}'),
                  trailing: Text('Rank: ${leader.classement}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
