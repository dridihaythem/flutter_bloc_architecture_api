import 'dart:convert';

import 'package:bloc_architecture/data/models/user.dart';

class Post {
  final int id;
  final User user;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.user,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
      'title': title,
      'body': body,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, user: $user, title: $title, body: $body)';
  }
}
