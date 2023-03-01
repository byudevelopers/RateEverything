import 'dart:async';

import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/topic.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/screens/feed/detail_screen.dart';
import 'package:app22_23/controllers/main_feed_controller.dart';

import 'package:app22_23/widgets/rating_list.dart';

class MainFeed extends StatefulWidget {
  final Topic topic;
  final List<Rating> ratings;
  late MainFeedController controller;

  MainFeed({Key? key, required this.topic, required this.ratings}) : super(key: key) {
    controller = MainFeedController(topic: topic);
  }

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loaded = true;
      });
    });
  }

  void run() {}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: (loaded)
                  ? Text(
                      widget.topic.question,
                      style: const TextStyle(
                          fontSize: 40, color: Color.fromARGB(255, 93, 0, 255)),
                    )
                  : Container(
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      ),
                    )),
          Expanded(
            child: RatingList(controller: widget.controller),
          ),
        ],
      ),
    );
  }
}
