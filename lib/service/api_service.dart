// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:very_good_project/utils/
part of very_good_project;

class ApiService {
  final Dio _dio = Dio();

  Future<Response<dynamic>> getPostData() async {
    try {
      final response = await _dio.get(baseUrl);
      return response;
    } catch (err) {
      print('Error :$err');
      rethrow;
    }
  }
}
