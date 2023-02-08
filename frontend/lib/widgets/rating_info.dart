import 'package:app22_23/model/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({Key? key, required this.rating}) : super(key: key);
  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blue,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          // color: Colors.pink,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // color: Colors.blue,
                height: 42,
                child: GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 12,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      repeatPattern: QuiltedGridRepeatPattern.same,
                      pattern: [
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 9),
                      ]),
                  physics: const NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      switch (index) {
                        case 0:
                          {
                            return Center(child: GridTile(
                              child: Text("${rating.value}",
                                style: TextStyle(fontSize: 24, 
                                fontWeight: FontWeight.w600),
                              ))
                            );
                          }
                        case 1:
                          {
                            return Center(
                              child: Icon(
                                Icons.insert_emoticon,
                                color: Colors.black,
                                size: 24,
                              ),
                            );
                          }
                        case 2:
                          {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: GridTile(child: Text(rating.username,
                                style: const TextStyle(fontSize: 24),
                              ))
                            );
                          }
                        default:
                          {
                            return const GridTile(child: Text("Test"));
                          }
                      }
                    },
                    childCount: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SizedBox(width: double.infinity, child: Text(rating.comment, textAlign: TextAlign.left,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
