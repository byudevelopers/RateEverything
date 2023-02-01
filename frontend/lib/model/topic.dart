import 'package:app22_23/model/feed.dart';

class Topic {
  late String question;
  late double averageRating;
  late Feed feed;

  Topic(this.question, this.averageRating, this.feed) {
    question = question;
    averageRating = averageRating;
    feed = feed;
  }
}
