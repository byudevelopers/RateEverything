import 'package:app22_23/controllers/detail_screen_controller.dart';
import 'package:app22_23/widgets/rating_box.dart';
import 'package:flutter/material.dart';

import '../../../model/comment.dart';
import 'comment_feed.dart';
import '../util_widget.dart';

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
          Expanded(
              child: CommentFeed(
            controller: controller,
          )),
        ]),
      ),
    );
  }
}

/// Returns a Userframe with a condensedText widget in it
///
/// Accepts [comment]
class CommentPanel extends StatelessWidget {
  final Comment comment;
  const CommentPanel({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserFrameWidget(
        user: comment.user, child: CondensedText(text: comment.comment));
  }
}

/// Displays a list of comments
///
/// Simply maps comments into CommentPanels and
/// stacks them with a column.
/// TODO: It is possible to remove this and just
///       dispay a whole list of comments that a list of
///       pages.
class CommentPageWidget extends StatelessWidget {
  final List<Comment> page;
  const CommentPageWidget({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children:
            page.map((e) => CommentPanel(comment: e)).toList(growable: false));
  }
}
