import 'package:app22_23/model/rating.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';
import 'package:app22_23/screens/feed/detail_screen.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({Key? key}) : super(key: key);

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  final List<Rating> _ratingList = [
    Rating(8, "BobSanders53", "I really like it."),
    Rating(-4, "BigShrek_420", "It is the worst thing ever."),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _ratingList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(rating: _ratingList[index]),
                    ));
              },
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const RatingBox()));
        },
      )
    );
  }
}
