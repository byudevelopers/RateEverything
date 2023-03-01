import 'package:app22_23/model/topic.dart';

class TabViewController {
  TabViewController();

  Topic getTodaysTopic() {
    // this is just a sample topic
    return Topic("SampleID", "What is your favorite color?", 10);
  }
}
