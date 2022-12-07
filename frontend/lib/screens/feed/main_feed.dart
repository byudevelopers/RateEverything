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
    Rating(-4, "BigShrek_420", "It wasn't very good."),
    Rating(10, "KanYe West", "Woop d scoop whoopidy whoop."),
    Rating(-9, "Elon_Musky10", "So musky."),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(23.0, 32.0, 32.0, 8.0),
                child: Text(
                  "Do you like pineapple on pizza?", 
                  style: TextStyle(fontSize: 36, color: Colors.black)
                )
              ),
              ListView.builder(
                shrinkWrap: true,
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
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: RatingBox(
                            rating: _ratingList[index],
                          )));
                },
              ),
            ],
      )),
    );
  }
}
