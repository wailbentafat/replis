import 'package:flutter/material.dart';
import 'package:mobile/src/core/constant/colors.dart';
import 'package:mobile/src/presentation/view_models/auth/leaderbaord_view.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  void initState() {
    super.initState();
    // Call getleaderboard only once during the first time the widget is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeaderbaordView>(context, listen: false).getleaderboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<LeaderbaordView>(
            builder: (context, leaderboardView, child) {
              if (leaderboardView.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (leaderboardView.error.isNotEmpty) {
                return Center(
                  child: Text("Error: ${leaderboardView.error}"),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: leaderboardView.leaderboard.length,
                    itemBuilder: (context, index) {
                      final leader = leaderboardView.leaderboard[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(leader.name),
                              Text('Score: ${leader.score}'),
                              Text('Rank: ${leader.classement}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(

            onPressed: () {
              
              Navigator.pop(context); 
            },
            child: const Text("Back",style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colorspick.primaryColor),
              elevation: MaterialStateProperty.all(5),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width*0.8 ,15),
              )
              
            ),
          ),
        ),
      ],
    );
  }
}
