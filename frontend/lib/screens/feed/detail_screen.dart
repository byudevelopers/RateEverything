import 'package:app22_23/controllers/detail_screen_controller.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/topic.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';

import '../../model/comment.dart';
import 'util_widget.dart';

class DetailScreen extends StatelessWidget {
  final DetailScreenController controller;
  DetailScreen({Key? key, required rating, required topic})
      : controller = DetailScreenController(rating, topic),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.getTopic().question),
      ),
      body: Center(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: RatingBox(
                rating: controller.getRating(),
              )),
          Text(controller.getRating().comment),
          Expanded(
              child: ListView.builder(
                  itemCount: controller.getAmountOfComments(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      CommentPanel(
                          index: index, comment: controller.getComment(index)),
                      const SizedBox(height: 20)
                    ]);
                  })),
        ]),
      ),
    );
  }
}

/// Returns a Userframe with a condensedText widget in it
///
/// Accepts [comment] as a Future Comment along with its
/// [index].
class CommentPanel extends StatefulWidget {
  final int index;
  final CommentController controller;
  CommentPanel(
      {Key? key, required this.index, required Future<Comment> comment})
      : controller = CommentController(comment),
        super(key: key);

  @override
  State<CommentPanel> createState() => _CommentPanelState();
}

/// checks if loaded, returns comment widget
class _CommentPanelState extends State<CommentPanel> {
  @override
  void initState() {
    super.initState();
    if (!widget.controller.isLoaded()) {
      widget.controller.onLoad((controller) => setState(() {}));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.isLoaded()) {
      return UserFrameWidget(
          user: widget.controller.getComment().user,
          child: CondensedText(text: widget.controller.getComment().comment));
    } else {
      return const Card(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            "···",
            style: TextStyle(fontSize: 40, letterSpacing: 20),
          ),
        ),
      ));
    }
  }
}
/*
class DetailScreen extends StatelessWidget {
  final Rating rating;
  final ICommentFetcher fetcher = TestCommentFetcher();

  DetailScreen({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Column(children: [
        Text(rating.username),
        Text(rating.comment),
        Expanded(
          child: ListView.builder(
              itemCount: 12 * fetcher.total,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  CommentPanel(
                      index: index % fetcher.total,
                      comment: fetcher.requestComment(index % fetcher.total)),
                  const SizedBox(height: 20)
                ]);
              }),
        )
      ]),
    );
  }
}
*/