import 'dart:async';
import 'dart:ffi';

import 'package:app22_23/model/comments/i_comment_fetcher.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/comments/comment.dart';
import 'package:app22_23/utils/basics.dart';
import 'package:app22_23/utils/future.dart';

import 'package:flutter/material.dart';

import '../../model/user.dart';

/// Creates widget with User image and name
///
/// Put's image left, then user's name then @username
class UserFrameWidget extends StatelessWidget {
  final User user;
  final Widget? child;

  const UserFrameWidget({Key? key, required this.user, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // IMAGE
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: buildImage(user.imagePath, 32, 32)),
      // USERNAME
      Expanded(
          child: Column(children: [
        const SizedBox(height: 12),
        Row(
          children: [
            //const SizedBox(width: 10),
            Text(
              user.name,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 01),
            ),
            const SizedBox(width: 5),
            Text(
              '@${user.username}',
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

  final int cutoff;

  const CondensedText({Key? key, required this.text, this.cutoff = 200})
      : super(key: key);

  @override
  State<CondensedText> createState() => _CondensedTextState();
}

/// State for CondensedText
class _CondensedTextState extends State<CondensedText> {
  /*static const weight = 20;*/
  bool condensable = false;
  late bool condensed;
  late String conString;

  @override
  void initState() {
    super.initState();

    condensable = widget.text.length > widget.cutoff;

    condensed = condensable;
    if (condensable) {
      conString = '${widget.text.substring(0, widget.cutoff)}…';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                child: Text(condensed ? conString : widget.text))));
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
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), __timerRunnable);
  }

  void __timerRunnable(Timer timer) {
    if (widget.comment.isLoaded()) {
      timer.cancel();
      setState(() {});
    } else if (widget.comment.hasFailed()) {
      timer.cancel();
    } else {
      timer.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.comment.isLoaded()) {
      return UserFrameWidget(
          user: widget.comment.get()!.user,
          child: CondensedText(text: widget.comment.get()!.comment));
    } else {
      return const Center(child: Text("..."));
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
