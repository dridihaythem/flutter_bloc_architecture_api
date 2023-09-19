import 'package:bloc_architecture/config/api.dart';
import 'package:dio/dio.dart';

class PostsDataProvider {
  Future<List> getAllPosts() async {
    Response<List> response = await Api.dio.get('/posts');
    return response.data!;
  }
}
