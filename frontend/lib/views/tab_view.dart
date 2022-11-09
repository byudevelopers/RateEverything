import 'package:app22_23/screens/leaderboard/leaderboard.dart';
import 'package:app22_23/screens/profile/profile.dart';
import 'package:app22_23/screens/rating/rating.dart';
import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';
import 'package:app22_23/widgets/rate_widget.dart';


class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
            0.1,
            0.3,
            0.7,
            0.9,
          ],
              colors: [
            Theme.of(context).tabBarTheme.unselectedLabelColor!,
            Theme.of(context).tabBarTheme.unselectedLabelColor!,
            Theme.of(context).tabBarTheme.labelColor!,
            Theme.of(context).tabBarTheme.labelColor!,
          ])),
      child: SafeArea(
        child: TabContainer(
          color: Theme.of(context).tabBarTheme.labelColor,
          tabs: const [
            'BeRate',
            'Leaderboard',
            'Profile',
          ],
          children: [
            Container(
              // width: double.infinity,
              // height: double.infinity,
              // color: Colors.amber,
              child: Rating(),
            ),
            Container(
              child: Leaderboard(),
              child: RatingBox(),
            ),
            Container(
              child: Profile(),
            ),
          ],
        ),
      ),
    );
  }
}
