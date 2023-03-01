import 'package:app22_23/controllers/podium_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/model/topic.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/screens/feed/main_feed.dart';

class PodiumList extends StatefulWidget {
  PodiumList({Key? key}) : super(key: key);

  @override
  State<PodiumList> createState() => _PodiumListState();
}

class _PodiumListState extends State<PodiumList> {
  // we should delete this because main feed should load the ratings, not tab view
  final List<List<Rating>> _ratingLists = [
    [
      Rating(9, 9, "thisGuy", "She is the best"),
      Rating(10, 10, "iAmCool", "She is the very best"),
    ],
    [
      Rating(9, 9, "thisGuy", "Cats are my favorite"),
      Rating(8, 8, "iAmCool", "Cats are the very best"),
    ],
    [
      Rating(8, 8, "thisGuy", "Pineapple on pizza is the best"),
      Rating(8, 8, "iAmCool", "Pineapple on pizza is cool"),
    ],
  ];

  final PodiumListController _controller = PodiumListController();

  @override
  Widget build(BuildContext context) {
    List<Topic> topicList = _controller.getTopicList();

    return ListView.builder(
      itemCount: topicList.length,
      itemBuilder: (context, position) {
        return GestureDetector(
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          topicList[position].question,
                        ),
                        Row(
                          children: [
                            Text(
                              topicList[position].averageRating.toString(),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              size: 24,
                            ),
                          ],
                        ),
                      ])),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text("Feed Screen"),
                          ),
                          body: MainFeed(
                              topic: topicList[position],
                              ratings: _ratingLists[position]))));
            });
      },
    );
  }
}
