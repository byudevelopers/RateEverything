import 'dart:async';
import 'package:app22_23/model/comments/i_comment_fetcher.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/comments/comment.dart';
import 'package:app22_23/utils/basics.dart';
import 'package:flutter/material.dart';
import '../../model/user.dart';

/// Creates widget with User image and name
///
/// Put's image left, then user's name then @username
class UserFrameWidget extends StatelessWidget {
  final User? user;
  final Widget? child;

  const UserFrameWidget({Key? key, required this.user, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // IMAGE
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: user != null
            ? buildImage(user!.imagePath, 32, 32)
            : const SizedBox(
                width: 32,
                height: 32,
              ),
      ),

      // USERNAME
      Expanded(
          child: Column(children: [
        const SizedBox(height: 12),
        Row(
          children: [
            //const SizedBox(width: 10),
            Text(
              user?.name ?? "        ",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 01),
            ),
            const SizedBox(width: 5),
            Text(
              user == null ? '...' : '@${user?.username}',
              style: TextStyle(color: Colors.grey[800], fontSize: 12),
            ),
          ],
        ),

        //CHILD
        child ?? const Text(""),
      ]))
    ]);
  }
}

/// Widget that truncates long text unless tapped on
///
/// Accepts [text] and cuts it off with [cuttoff]
class CondensedText extends StatefulWidget {
  final String text;

  final int charCutoff;
  final int nlCutoff;

  const CondensedText(
      {Key? key, required this.text, this.charCutoff = 200, this.nlCutoff = 4})
      : super(key: key);

  @override
  State<CondensedText> createState() => _CondensedTextState();
}

/// State for CondensedText
class _CondensedTextState extends State<CondensedText> {
  /*static const weight = 20;*/
  bool condensable = false;
  late bool condensed = true;
  late String conString = "";

  @override
  void initState() {
    super.initState();

    int lines = '\n'.allMatches(widget.text).length + 1;

    condensable =
        widget.text.length > widget.charCutoff || lines > widget.nlCutoff;

    if (condensable) {
      int ind = 0;
      for (int i = 0; i < widget.nlCutoff; i++) {
        ind = widget.text
            .indexOf('\n', ind + (ind == (widget.text.length - 1) ? 0 : 1));
        if (ind == -1) {
          break;
        }
      }

      condensed = true;
      if (condensable) {
        if (ind == -1 || widget.charCutoff < ind) {
          conString = '${widget.text.substring(0, widget.charCutoff)}…';
        } else {
          conString = '${widget.text.substring(0, ind)}…';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return condensable
        ? InkWell(
            onTap: () {
              setState(() {
                condensed = !condensed && condensable;
              });
            },
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, top: 5, right: 10, bottom: 10),
                    child: Text(condensed ? conString : widget.text))))
        : Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 5, right: 10, bottom: 10),
                child: Text(widget.text)));
  }
}

/// Returns a Userframe with a condensedText widget in it
///
/// Accepts [comment] as a Future Comment along with its
/// [index].
class CommentPanel extends StatefulWidget {
  final int index;
  final Future<Comment> comment;
  const CommentPanel({Key? key, required this.index, required this.comment})
      : super(key: key);

  @override
  State<CommentPanel> createState() => _CommentPanelState();
}

/// Keeps
///
/// The widget uses a Timer incase the Future is
/// not completed for which a loading widget is given.
class _CommentPanelState extends State<CommentPanel> {
  bool loaded = false;
  late Comment comment;

  @override
  void initState() {
    super.initState();
    widget.comment
        .then((value) => {comment = value})
        .whenComplete(() => __loadRunnable());
  }

  void __loadRunnable() {
    setState(() {
      loaded = true;
      comment = comment;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return UserFrameWidget(
          user: comment.user, child: CondensedText(text: comment.comment));
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
              itemCount: 10 * fetcher.total,
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
