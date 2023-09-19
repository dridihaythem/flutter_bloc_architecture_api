import 'package:dio/dio.dart';

class Api {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      receiveDataWhenStatusError: true,
    ),
  );
}
