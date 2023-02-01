import 'dart:async';

import 'package:app22_23/model/comments/i_comment_fetcher.dart';
import 'package:app22_23/model/rating.dart';
import 'package:app22_23/model/comments/comment.dart';
import 'package:app22_23/utils/basics.dart';
import 'package:app22_23/utils/future.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:app22_23/utils/basics.dart';
import 'package:flutter/material.dart';

class CommentPanel extends StatefulWidget {
  late int index;
  late Future<Comment> comment;
  CommentPanel({Key? key, required index, required this.comment})
      : super(key: key);

  @override
  State<CommentPanel> createState() => _CommentPanelState(comment: comment);
}

class _CommentPanelState extends State<CommentPanel> {
  bool condense = false;
  late Timer _timer;

  Future<Comment> comment;

  _CommentPanelState({required this.comment});

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (comment.isLoaded()) {
        timer.cancel();
        setState(() {
          condense = comment.get()!.comment.length > 200;
        });
      } else if (comment.hasFailed()) {
        timer.cancel();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (comment.isLoaded()) {
      // return Column(children: [
      //   Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Padding(
      //             padding:
      //                 const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      //             child: Column(children: [
      //               buildImage(comment.get()!.user.imagePath, 48, 48)
      //             ])),
      //         Column(children: [
      //           Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Text(comment.get()!.user.name,
      //                     style: const TextStyle(fontSize: 20)),
      //                 const SizedBox(width: 5),
      //                 Text(
      //                   comment.get()!.user.username,
      //                   style: const TextStyle(
      //                       fontSize: 15,
      //                       color: Color.fromARGB(255, 24, 53, 67)),
      //                 ),
      //                 //Spacer(),
      //               ]),
      //           // Padding(
      //           //   padding:
      //           //       const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      //           //   child: Align(
      //           //       alignment: Alignment.topLeft,
      //           Text(comment.get()!.comment, textAlign: TextAlign.left),
      //           //),
      //         ])
      //       ])
      // ]);

      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: buildImage(comment.get()!.user.imagePath, 48, 48)),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      comment.get()!.user.name,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      comment.get()!.user.username,
                      style: TextStyle(color: Colors.grey[800], fontSize: 12),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(comment.get()!.comment)))
              ]),
        )
      ]);
    } else {
      return const Center(child: Text("..."));
    }
  }
}

// class _LoadingCommentState extends State<CommentPanel> {
//   late int index;

//   _LoadingCommentState(index) : index = index {}

//   }
// }

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
              itemCount: 2 * fetcher.total,
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
