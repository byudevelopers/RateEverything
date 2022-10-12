import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

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
              child: Text('Child 1'),
            ),
            Container(
              child: Text('Child 2'),
            ),
            Container(
              child: Text('Child 3'),
            ),
          ],
        ),
      ),
    );
  }
}
