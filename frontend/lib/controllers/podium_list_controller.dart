import 'package:app22_23/model/topic.dart';

class PodiumListController {
  PodiumListController();

  List<Topic> getTopicList() {
    // this is just sample topics
    final List<Topic> topicList = [
      Topic("SampleID", "Taylor Swift", 9.7),
      Topic("SampleID", "Cats", 8.6),
      Topic("SampleID", "Pineapple on Pizza", 7.9),
    ];

    return topicList;
  }
}