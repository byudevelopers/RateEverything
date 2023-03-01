import 'package:app22_23/model/topic.dart';
import 'package:app22_23/model/rating.dart';

class MainFeedController {
  final bool _loading;
  final Topic topic;

  MainFeedController({required this.topic}) : _loading = false;

  Topic getTopic() {
    return topic;
  }

  Rating getRating(int index) {
    return Mock.RATINGS[index % Mock.RATINGS.length];
  }

  int getAmountOfRatings() {
    return 20;
  }

  bool isLoading() {
    return _loading;
  }
}

class Mock {
  static List<Rating> RATINGS = [
    Rating(1, "bob", "BOBOBOBOBOBOB"),
    Rating(2, "Jim", "Why did nasa do 7/11"),
    Rating(3, "Evan", "I am a in love with my personal suffering"),
    Rating(1, "Kimn", "[Illegible Chinese muttering]"),
    Rating(1, "why", "why"),
    Rating(1, "Ab lincholn",
        "abfcsdbaf as dsjbsa   asdlkfbkjasdfd ljkbzsdj sfdlkbjsadjkblsda dfs daskfsdalkhsadfbdsfabsdfabkbsadhjfsda")
  ];
}
