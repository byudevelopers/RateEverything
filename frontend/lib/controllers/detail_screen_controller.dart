import 'dart:math';

import '../model/comment.dart';
import '../model/rating.dart';
import '../model/topic.dart';
import '../model/user.dart';

class DetailScreenController {
  final Rating _rating;
  final Topic _topic;

  const DetailScreenController(rating, topic)
      : _rating = rating,
        _topic = topic;

  Rating getRating() {
    return _rating;
  }

  Topic getTopic() {
    return _topic;
  }

  Future<Comment> getComment(int index) async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(100)));
    return Mock.comments[index];
  }

  int getAmountOfComments() {
    return 100;
  }
}

class CommentController {
  bool _loaded = false;
  late final Comment comment;
  final Future<Comment> _future;

  CommentController(Future<Comment> comment) : _future = comment {
    _future.then(__load);
  }

  void __load(Comment value) {
    comment = value;
    _loaded = true;
  }

  Comment getComment() {
    return comment;
  }

  bool isLoaded() {
    return _loaded;
  }

  void onLoad(Function(CommentController) fn) {
    if (isLoaded()) {
      fn(this);
      return;
    }
    _future.then((value) => fn(this));
  }
}

class Mock {
  static List<Comment> comments = [
    Comment(
        id: 1,
        value: 3,
        timestamp: DateTime.now().millisecondsSinceEpoch - 100000000000,
        user: bob,
        comment:
            """If your ego starts out, 'I am important, I am big, I am special,' you're in for some disappointments when you look around at what we've discovered about the universe. No, you're not big. No, you're not. You're small in time and in space. And you have this frail vessel called the human body that's limited on Earth.""",
        ratingId: -100),
    Comment(
        id: 2,
        value: 4,
        timestamp: DateTime.now().millisecondsSinceEpoch - 10000,
        user: amy,
        comment:
            "If a man does not keep pace with his companions, perhaps it is because he hears a different drummer. Let him step to the music which he hears, however measured or far away.",
        ratingId: -100),
    Comment(
        id: 3,
        value: 5,
        timestamp: DateTime.now().millisecondsSinceEpoch - 9387477263533,
        user: ann,
        comment:
            """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla urna porttitor rhoncus dolor. Et netus et malesuada fames ac turpis. Vulputate enim nulla aliquet porttitor lacus. Massa enim nec dui nunc mattis enim. Magna eget est lorem ipsum dolor. Amet commodo nulla facilisi nullam vehicula. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Eu feugiat pretium nibh ipsum. Risus ultricies tristique nulla aliquet enim. Dui nunc mattis enim ut tellus.
At elementum eu facilisis sed. Nec sagittis aliquam malesuada bibendum arcu vitae elementum curabitur. Et leo duis ut diam quam nulla. Id diam maecenas ultricies mi. Eget gravida cum sociis natoque penatibus et magnis. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Leo duis ut diam quam nulla. Ultrices vitae auctor eu augue ut lectus. Orci eu lobortis elementum nibh tellus molestie nunc. Duis convallis convallis tellus id interdum velit. Nec feugiat in fermentum posuere urna nec tincidunt praesent semper.
Amet mauris commodo quis imperdiet massa tincidunt. Vitae semper quis lectus nulla at volutpat diam ut. Consequat id porta nibh venenatis cras sed felis eget velit. Dui sapien eget mi proin sed. Eu non diam phasellus vestibulum lorem sed risus ultricies tristique. Pellentesque dignissim enim sit amet venenatis urna cursus eget. Facilisis gravida neque convallis a cras semper auctor. Netus et malesuada fames ac turpis egestas sed. Senectus et netus et malesuada fames ac. Sed ullamcorper morbi tincidunt ornare massa. Mi in nulla posuere sollicitudin aliquam.
Egestas fringilla phasellus faucibus scelerisque eleifend donec. Facilisis mauris sit amet massa vitae. Integer malesuada nunc vel risus commodo. Sit amet commodo nulla facilisi nullam vehicula ipsum a. Integer vitae justo eget magna fermentum iaculis eu. Ipsum a arcu cursus vitae congue. Odio eu feugiat pretium nibh ipsum consequat nisl vel. Tellus elementum sagittis vitae et leo duis. Lobortis mattis aliquam faucibus purus in massa tempor nec feugiat. Cras pulvinar mattis nunc sed blandit libero volutpat sed cras. Tempus quam pellentesque nec nam. Tellus molestie nunc non blandit massa enim nec dui nunc. Consequat ac felis donec et odio pellentesque diam volutpat. Tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero. Sed arcu non odio euismod lacinia at quis. Et malesuada fames ac turpis egestas maecenas pharetra convallis.
Dignissim cras tincidunt lobortis feugiat vivamus at augue eget. Aliquam ut porttitor leo a diam sollicitudin. Turpis egestas integer eget aliquet nibh. Est velit egestas dui id ornare arcu. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Pharetra pharetra massa massa ultricies mi quis hendrerit. Accumsan in nisl nisi scelerisque eu ultrices vitae. Varius quam quisque id diam vel quam elementum pulvinar. Neque convallis a cras semper auctor neque vitae. Turpis egestas maecenas pharetra convallis posuere. Proin sed libero enim sed. Ultrices in iaculis nunc sed augue. In fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Morbi tristique senectus et netus et malesuada fames ac turpis. Duis ut diam quam nulla porttitor massa. Urna neque viverra justo nec ultrices dui. Sit amet nisl suscipit adipiscing bibendum est ultricies integer quis.""",
        ratingId: -100),
    Comment(
        id: 4,
        value: 6,
        timestamp: DateTime.now().millisecondsSinceEpoch - 10000000,
        user: bob,
        comment: """Hold fast to dreams 
For if dreams die
Life is a broken-winged bird
That cannot fly.
Hold fast to dreams
For when dreams go
Life is a barren field
Frozen with snow.""",
        ratingId: -100),
    Comment(
        id: 5,
        value: 7,
        timestamp: DateTime.now().millisecondsSinceEpoch - 100000,
        user: jill,
        comment: "What is Love?",
        ratingId: -100)
  ];

  static const User bob = User(
      imagePath:
          "https://vetmed.tamu.edu/news/wp-content/uploads/sites/9/2021/11/Turtle-brumation-pet-talk-1024x767.jpeg",
      name: "Bob",
      username: "bobisme",
      email: "email",
      about: "about",
      isDarkMode: true);
  static const User amy = User(
      imagePath:
          "https://png.pngtree.com/png-vector/20190927/ourmid/pngtree-lovely-bat-clipart-vector-png-element-png-image_1749074.jpg",
      name: "Amy",
      username: "amylike",
      email: "email",
      about: "about",
      isDarkMode: true);
  static const User jim = User(
      imagePath:
          "https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2022/07/what_to_know_apples_green_red_1296x728_header-1024x575.jpg?w=1155&h=1528",
      name: "Jim",
      username: "jimfarrol",
      email: "email",
      about: "about",
      isDarkMode: true);
  static const User jill = User(
      imagePath:
          "https://www.seekpng.com/png/detail/364-3647768_yellow-flower-clip-art-png-flower-with-5.png",
      name: "Jill",
      username: "jillyness",
      email: "email",
      about: "about",
      isDarkMode: true);
  static const User ann = User(
      imagePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg",
      name: "Ann",
      username: "annmay",
      email: "email",
      about: "about",
      isDarkMode: true);
}
