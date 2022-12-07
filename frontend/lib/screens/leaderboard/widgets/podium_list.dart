import 'package:flutter/material.dart';
import 'package:app22_23/model/topic.dart';

class PodiumList extends StatefulWidget {
  PodiumList({Key? key}) : super(key: key);

  @override
  State<PodiumList> createState() => _PodiumListState();
}

class _PodiumListState extends State<PodiumList> {
  final List<Topic> _topicList = [
    Topic("Taylor Swift", 9.7),
    Topic("Minecraft", 9.3),
    Topic("Cats", 8.6),
    Topic("Pineapple on Pizza", 7.9),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _topicList.length,
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _topicList[position].question,
                ),
                Text(
                  _topicList[position].averageRating.toString(),
                ),
              ]
            )
          ),
        );
      },
    );
  }
}
