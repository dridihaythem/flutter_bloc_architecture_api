import 'package:bloc_architecture/data/dataproviders/posts_data_provider.dart';
import 'package:bloc_architecture/data/models/post.dart';
import 'package:bloc_architecture/data/models/user.dart';

class PostsRepository {
  final PostsDataProvider _postsDataProvider;

  PostsRepository(this._postsDataProvider);

  Future<List<Post>> getAllPosts(List<User> users) async {
    List data = await _postsDataProvider.getAllPosts();
    return data.map((e) {
      e['user'] = users.firstWhere((user) => user.id == e['userId']).toMap();
      return Post.fromMap(e);
    }).toList();
  }
}
