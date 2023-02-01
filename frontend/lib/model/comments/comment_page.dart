import 'package:app22_23/model/comments/comment.dart';
import 'package:app22_23/model/user.dart';

class CommentPage {
  final int id;
  late int length;
  late int index;

  late List<Comment> comments = List<Comment>.filled(1, NULL_COMMENT);

  CommentPage(int cPageId) : id = cPageId {}

  void load() {
    //Code to load values in;
  }
}
