import 'package:app22_23/model/rating.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/screens/feed/detail_screen.dart';
import 'package:app22_23/model/topic.dart';

class MainFeed extends StatefulWidget {
  final Topic topic;
  const MainFeed({Key? key, required this.topic}) : super(key: key);

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      widget.topic.question,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    widget.topic.averageRating.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.topic.feed.ratingList.length,
                  itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(rating: widget.topic.feed.ratingList[index]),
                        ));
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: RatingBox(
                        rating: widget.topic.feed.ratingList[index],
                      )));
                  },
                ),
            ),
          ],
        ));
  }
}
