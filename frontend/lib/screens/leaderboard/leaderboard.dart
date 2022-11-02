import 'package:flutter/material.dart';
import 'package:app22_23/views/show_more_button.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[ 
          const Text("Leaderboard"),
          ShowMoreButton(),
          ],
      );
  }
}
