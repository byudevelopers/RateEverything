import 'package:app22_23/model/topic.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/screens/feed/detail_screen.dart';

import 'package:app22_23/widgets/rating_list.dart';

class MainFeed extends StatefulWidget {
  final Topic topic;
  const MainFeed({Key? key, required this.topic}) : super(key: key);

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              widget.topic.question,
              style: const TextStyle(
                  fontSize: 40, color: Color.fromARGB(255, 93, 0, 255)),
            ),
          ),
          Expanded(
            child: RatingList(topic: widget.topic),
          ),
        ],
      ),
    );
  }
}
