import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:very_good_project/constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  final url = '$baseUrl$posts';

  Future<Response<dynamic>> getPostData() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return response;
    } catch (err) {
      print('Error :$err');
      rethrow;
    }
  }
}
