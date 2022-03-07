import 'package:dio/dio.dart';

import '../models/post_model.dart';
import 'api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;
  Future<List<Post>> getPostList() async {
    final response = await apiService.getPostData();
    // ignore: unnecessary_null_comparison
    final data = response.data as List<dynamic>;
    return data
        .map(
          (dynamic singlePost) =>
              Post.fromMap(singlePost as Map<String, dynamic>),
        )
        .toList();
  }
}
