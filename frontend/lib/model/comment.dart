import 'user.dart';

class Comment {
  final int id;
  final int value;
  final int timestamp;
  final User user;
  final String comment;
  final int ratingId;

  const Comment(
      {required this.id,
      required this.value,
      required this.timestamp,
      required this.user,
      required this.comment,
      required this.ratingId});
}
