import 'dart:convert';
import 'package:http/http.dart' as http;

Future<User> fetchUser() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

class User {
  final String imagePath;
  final String name;
  final String username;
  final String email;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.username,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

  User copy({
    String? imagePath,
    String? name,
    String? username,
    String? email,
    String? about,
    bool? isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        about: json['about'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'username': username,
        'email': email,
        'about': about,
        'isDarkMode': isDarkMode,
      };
}
