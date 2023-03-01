import 'package:app22_23/model/topic.dart';
import 'package:app22_23/model/rating.dart';

class MainFeedController {
  final bool _loading;

  MainFeedController() : _loading = false {}

  Future<Topic> getTopic() async {
    final List<Rating> ratingList = [
      Rating(8, "BobSanders53", "I really like it."),
      Rating(-4, "BigShrek_420", "It wasn't very good."),
      Rating(10, "KanYe West", "Woop d scoop whoopidy whoop."),
    ];
    late final Topic topic = Topic("SampleID", "What is your favorite color?", 10);

    return topic;
  }

  bool isLoading() {
    return _loading;
  }
}
