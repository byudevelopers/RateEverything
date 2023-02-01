import 'package:app22_23/model/comments/comment.dart';
import 'package:app22_23/model/user.dart';
import 'package:app22_23/utils/future.dart';
import 'dart:io';

class ICommentFetcher {
  late int total;

  /// This will allow for test code as well as a real implementation
  /// to fetch comments from the server.
  ///
  /// What could be the real implementation is that it will keep track of
  /// what comment pages it has cached and will handle requests. Basically
  /// abstracts away the need for commentpages.
  Future<Comment> requestComment(int index) {
    return Future<Comment>(NULL_COMMENT);
  }
}

class TestCommentFetcher implements ICommentFetcher {
  @override
  late int total = 5;

  var comments = [
    Comment(1, 3, 10000, bob, """I
t is unclear from the text exactly where
or when Jacob offered his magnificent
discourse recorded in 2 Nephi 6–10, but
while such details are missing, the discourse
itself stands as one of the most powerful
passages of scripture in the Book of Mormon"""),
    Comment(2, 4, 10100, amy, "NO NO NO NO NO NO NO NO NO"),
    Comment(3, 5, 11000, ann, "THE EYES the eyes"),
    Comment(4, 6, 20000, bob,
        """Jehovah Creates the Earth, by Walter Rane. Courtesy Museum of Church
History and Art. Top: Jacob teaches the Nephites. Illustration by Jerry
Thompson. © IRI. Opposite: Parting of the Red Sea, copyrighted by Arnold
Friberg © (2008) and used by permission from Friberg Fine Art. For more
information visit: www.fribergfineart.com. Opposite background: The
Egyptians Drowned in the Red Sea, by Gustave Doré. """),
    Comment(5, 7, 21000, jill, "Love is a byword")
  ];

  /// This will allow for test code as well as a real implementation
  /// to fetch comments from the server.
  ///
  /// What could be the real implementation is that it will keep track of
  /// what comment pages it has cached and will handle requests. Basically
  /// abstracts away the need for commentpages.
  Future<Comment> requestComment(int index) {
    return Future<Comment>(comments[index]);
  }
}

const User bob = User(
    imagePath:
        "https://vetmed.tamu.edu/news/wp-content/uploads/sites/9/2021/11/Turtle-brumation-pet-talk-1024x767.jpeg",
    name: "Bob",
    username: "bobisme",
    email: "email",
    about: "about",
    isDarkMode: true);
const User amy = User(
    imagePath:
        "https://png.pngtree.com/png-vector/20190927/ourmid/pngtree-lovely-bat-clipart-vector-png-element-png-image_1749074.jpg",
    name: "Amy",
    username: "amylike",
    email: "email",
    about: "about",
    isDarkMode: true);
const User jim = User(
    imagePath:
        "https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2022/07/what_to_know_apples_green_red_1296x728_header-1024x575.jpg?w=1155&h=1528",
    name: "Jim",
    username: "jimfarrol",
    email: "email",
    about: "about",
    isDarkMode: true);
const User jill = User(
    imagePath:
        "https://www.seekpng.com/png/detail/364-3647768_yellow-flower-clip-art-png-flower-with-5.png",
    name: "Jill",
    username: "jillyness",
    email: "email",
    about: "about",
    isDarkMode: true);
const User ann = User(
    imagePath:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg",
    name: "Ann",
    username: "annmay",
    email: "email",
    about: "about",
    isDarkMode: true);
