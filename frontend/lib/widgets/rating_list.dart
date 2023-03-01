import 'package:app22_23/screens/feed/detail_screen.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/model/topic.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/screens/feed/main_feed.dart';

class RatingList extends StatefulWidget {
  RatingList({Key? key, required this.topic}) : super(key: key);
  final Topic topic;
  @override
  State<RatingList> createState() => _RatingListState();
}

class _RatingListState extends State<RatingList> {
  final List<Rating> _ratingList = [
    Rating(9, "thisGuy", "She is the best"),
    Rating(10, "iAmCool", "She is the very best"),
    Rating(9, "thisGuy", "Cats are my favorite"),
    Rating(8, "iAmCool", "Cats are the very best"),
    Rating(8, "thisGuy", "Pineapple on pizza is the best"),
    Rating(9, "thisGuy", "She is the best"),
    Rating(10, "iAmCool", "She is the very best"),
    Rating(9, "thisGuy", "Cats are my favorite"),
    Rating(8, "iAmCool", "Cats are the very best"),
    Rating(8, "thisGuy", "Pineapple on pizza is the best"),
    Rating(8, "iAmCool", "Pineapple on pizza is cool")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _ratingList.length,
      itemBuilder: (context, position) {
        return GestureDetector(
            child: Card(
                child: RatingBox(
              rating: _ratingList[position],
            )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          rating: _ratingList[position],
                          prompt: widget.topic.question)));
            });
      },
    );
  }
}
