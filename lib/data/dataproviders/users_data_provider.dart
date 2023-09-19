import 'package:bloc_architecture/config/api.dart';
import 'package:dio/dio.dart';

class UsersDataProvider {
  Future<List> getAllUsers() async {
    Response<List> response = await Api.dio.get('/users');
    return response.data!;
  }
}
