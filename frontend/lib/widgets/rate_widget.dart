import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.amber,
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
                        const QuiltedGridTile(1, 1),
                      ]),
                  physics: const NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      switch (index) {
                        case 0:
                          {
                            return Center(child: const GridTile(
                              child: Text("8",
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
                              child: const GridTile(child: Text("Johnny22",
                                style: TextStyle(fontSize: 24),
                              ))
                            );
                          }
                        case 3:
                          {
                            return Center(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.black,
                                size: 24,
                              ),
                            );
                          }
                        case 4:
                          {
                            return Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 24,
                              ),
                            );
                          }
                        default:
                          {
                            return const GridTile(child: Text("Default"));
                          }
                      }
                    },
                    childCount: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                    "This is my extremely controversial rating that makes people very upset"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
