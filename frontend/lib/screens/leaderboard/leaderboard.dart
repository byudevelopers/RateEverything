import 'package:flutter/material.dart';
import 'package:app22_23/screens/leaderboard/widgets/podium_list.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: const Text(
            "Leaderboard",
          ),
        ),
        Expanded(
          child: PodiumList(),
        ),
      ],
    );
  }
}
