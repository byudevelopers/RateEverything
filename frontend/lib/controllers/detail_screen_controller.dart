import 'dart:collection';
import 'dart:math';

import '../model/comment.dart';
import '../model/rating.dart';
import '../model/topic.dart';
import '../model/user.dart';

class DetailScreenController {
  final Rating _rating;
  final Topic _topic;
  final Map<int, List<Comment>> _pages = HashMap(); // TODO: List<Comment> ?

  DetailScreenController(rating, topic)
      : _rating = rating,
        _topic = topic;

  Rating getRating() {
    return _rating;
  }

  Topic getTopic() {
    return _topic;
  }

  /// use [index] to fetch page from [_pages] cache.
  List<Comment> getCommentPage(int index) {
    return _pages[index]!;
  }

  //TODO
  Future<List<Comment>?> requestCommentPage(int index) async {
    /// TODO: call async function, add to cache, and return controller

    // simulate time delay
    await Future.delayed(Duration(milliseconds: Random().nextInt(1000) + 1000));
    List<Comment>? result =
        (index < 20) ? Mock.comments[index % Mock.comments.length] : null;
    return _cache(index, result);
  }

  /// Wraps around a result to add to cache
  List<Comment>? _cache(int index, List<Comment>? result) {
    if (result != null) _pages[index] = result;
    return result;
  }

  /// Returns amount of loaded pages
  int cacheSize() {
    return _pages.length;
  }
}

/// Contains list of mock comments
class Mock {
  static List<List<Comment>> comments = [
    [
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
    ],
    [
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
    ],
    [
      Comment(
          id: 1,
          value: 3,
          timestamp: DateTime.now().millisecondsSinceEpoch - 100000000000,
          user: bob,
          comment: """ABCDEFGE""",
          ratingId: -100),
      Comment(
          id: 2,
          value: 4,
          timestamp: DateTime.now().millisecondsSinceEpoch - 10000,
          user: amy,
          comment: "AAAAAAAAAA",
          ratingId: -100),
      Comment(
          id: 3,
          value: 5,
          timestamp: DateTime.now().millisecondsSinceEpoch - 9387477263533,
          user: ann,
          comment:
              """Alteration literature to or an sympathize mr imprudence. Of is ferrars subject as enjoyed or tedious cottage. Procuring as in resembled by in agreeable. Next long no gave mr eyes. Admiration advantages no he celebrated so pianoforte unreserved. Not its herself forming charmed amiable. Him why feebly expect future now.

Unpacked now declared put you confined daughter improved. Celebrated imprudence few interested especially reasonable off one. Wonder bed elinor family secure met. It want gave west into high no in. Depend repair met before man admire see and. An he observe be it covered delight hastily message. Margaret no ladyship endeavor ye to settling.""",
          ratingId: -100),
      Comment(
          id: 4,
          value: 6,
          timestamp: DateTime.now().millisecondsSinceEpoch - 10000000,
          user: bob,
          comment:
              """A factorial experiment, the ideal produced, five will discuss some cases using experimentation. These called to follow a factorial experiment can at randomized correctly. In the smalled a composition means different as observation
Experimenterest is needed. Several random order in this whethere are prepared to 20. 7ement population, we will discuss than also be called experiment treatmenter had to treatment.

Comples, 1992) designed properly, and so on.

TABLE 9.1One-Factor, the hardness of possible of the four flux A have I same, due, from Page 670Figure is on HSLA-100 and to treatmental units are called to that concertainty introducing and can be cases corresponse variable assigned ther the first five numbers from a different describes are made are essentially likely, and AISI-1081 Steel base plates, a greatmented by ther the integers correctly. In this is not favor another by the in which welds were assign of fluxes is to treatment is test concertainty introduced""",
          ratingId: -100),
      Comment(
          id: 5,
          value: 7,
          timestamp: DateTime.now().millisecondsSinceEpoch - 100000,
          user: jill,
          comment: "Bobu",
          ratingId: -100)
    ]
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
