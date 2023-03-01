import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/topic.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Rating rating;
  final Topic topic;
  const DetailScreen({Key? key, required this.rating, required this.topic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.question),
      ),
      body: Center(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: RatingBox(
                rating: rating,
              )),
          Text(rating.comment),
        ]),
      ),
    );
  }
}
