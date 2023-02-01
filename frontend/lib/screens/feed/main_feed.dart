import 'package:app22_23/model/rating.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/screens/feed/detail_screen.dart';
import 'package:app22_23/model/feed.dart';

class MainFeed extends StatefulWidget {
  final Feed feed;
  const MainFeed({Key? key, required this.feed}) : super(key: key);

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: widget.feed.ratingList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(rating: widget.feed.ratingList[index], prompt: "test",),
                  ));
            },
            child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: RatingBox(
                  rating: widget.feed.ratingList[index],
                )));
      },
    ));
  }
}
