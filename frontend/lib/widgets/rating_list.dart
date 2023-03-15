import 'package:app22_23/controllers/main_feed_controller.dart';
import 'package:app22_23/screens/feed/detail_screen/detail_screen.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/model/rating.dart';

class RatingList extends StatefulWidget {
  const RatingList({Key? key, required this.controller}) : super(key: key);
  final MainFeedController controller;

  @override
  State<RatingList> createState() => _RatingListState();
}

class _RatingListState extends State<RatingList> {
  /*final List<Rating> _ratingList = [
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
  ];*/
  @override
  Widget build(BuildContext context) {
    int length = widget.controller.getAmountOfRatings();

    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, position) {
        Rating rating = widget.controller.getRating(position);

        return GestureDetector(
            child: Card(
                child: RatingBox(
              rating: rating,
            )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          rating: rating,
                          topic: widget.controller.getTopic())));
            });
      },
    );
  }
}
