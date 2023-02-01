import 'package:flutter/material.dart';
import 'package:app22_23/model/topic.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/feed.dart';
import 'package:app22_23/screens/feed/main_feed.dart';

class PodiumList extends StatefulWidget {
  PodiumList({Key? key}) : super(key: key);

  @override
  State<PodiumList> createState() => _PodiumListState();
}

class _PodiumListState extends State<PodiumList> {
  final List<Topic> _topicList = [
    Topic("Taylor Swift", 9.7, Feed([
      Rating(9, "thisGuy", "She is the best"),
      Rating(10, "iAmCool", "She is the very best"),
    ])),
    Topic("Cats", 8.6, Feed([
      Rating(9, "thisGuy", "Cats are my favorite"),
      Rating(8, "iAmCool", "Cats are the very best"),
    ])),
    Topic("Pineapple on Pizza", 7.9, Feed([
      Rating(8, "thisGuy", "Pineapple on pizza is the best"),
      Rating(8, "iAmCool", "Pineapple on pizza is cool"),
    ])),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _topicList.length,
      itemBuilder: (context, position) {
        return GestureDetector(
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _topicList[position].question,
                        ),
                        Row(
                          children: [
                            Text(
                              _topicList[position].averageRating.toString(),
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
                    builder: (context) => 
                      Scaffold(
                        appBar: AppBar(
                          title: const Text("Feed Screen"),
                        ),
                        body: MainFeed(feed: _topicList[position].feed)
                      )
                  ));
            });
      },
    );
  }
}
