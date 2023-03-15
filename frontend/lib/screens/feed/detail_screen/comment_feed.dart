import 'package:flutter/material.dart';

import '../../../controllers/detail_screen_controller.dart';
import 'detail_screen.dart';

/// This bad boy loads and displays comments by page
///
/// It will do an inital loading base on [init]. It will lazily loads as it
/// gets down to the trigger.
class CommentFeed extends StatefulWidget {
  static const int init = 5; // How many pages are loaded at the begginig
  static const int loadSize = 1; // How many pages are loaded per request
  final DetailScreenController controller;

  /// Accepts [DetailScreenController] as [controller]
  const CommentFeed({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommentFeedState();
}

class _CommentFeedState extends State<CommentFeed> {
  bool _lastPage = false; // set when null encountered
  bool _loading = false; // Prevent extraneous loading

  /// When setting state, this makes sure the Widget is not disposed of.
  ///
  /// Takes the [numLoaded], [lastPage], and [loading]. If one of these are
  /// not specified, it will assume the old value.
  void safeSetState({bool? lastPage, bool? loading}) {
    if (mounted) {
      setState(() {
        if (lastPage != null) _lastPage = lastPage;
        if (loading != null) _loading = false;
      });
    }
  }

  @override
  void initState() {
    _loading = true;
    groupFetch(CommentFeed.init);
    super.initState();
  }

  /// Fetches the amount of pages set by [amount] and reloads widget
  /// when finished. It does this asynchrously and
  void groupFetch(int amount) async {
    bool wasNullEncountered = false;
    int base = widget.controller.cacheSize();
    await Future.wait(List.generate(
        amount,
        (i) => widget.controller.requestCommentPage(base + i).then((value) {
              if (value == null) wasNullEncountered = true;
            })));
    safeSetState(loading: false, lastPage: wasNullEncountered);
  }

  // Builds list view, grabs already loaded pages from controller cache
  // adds Trigger at end that will run load more when visible
  @override
  Widget build(BuildContext context) {
    return (!_lastPage && widget.controller.cacheSize() == 0)
        ? Trigger(loading: true, callback: () {})
        : ListView.builder(
            itemCount: widget.controller.cacheSize() + (_lastPage ? 0 : 1),
            itemBuilder: (BuildContext context, int index) {
              if (index < widget.controller.cacheSize()) {
                return Column(children: [
                  CommentPageWidget(
                      page: widget.controller.getCommentPage(index)),
                  const SizedBox(height: 20),
                  Text("$index")
                ]);
              } else {
                return Trigger(loading: _loading, callback: load);
              }
            });
  }

  /// Will send request to server
  void load() {
    safeSetState(loading: true);
    groupFetch(CommentFeed.loadSize);
  }
}

/// If [loading] this will simply display CircularProgress indicator, otherwise
/// it will also run [callback]
class Trigger extends StatelessWidget {
  final bool loading;
  final Function() callback;
  const Trigger({Key? key, required this.loading, required this.callback})
      : super(key: key);

  Future<void> _scheduleAfterBuild(Function() fn) async {
    await Future.delayed(Duration.zero);
    fn();
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      _scheduleAfterBuild(callback);
    }
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 28),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.pink,
          ),
        ));
  }
}
