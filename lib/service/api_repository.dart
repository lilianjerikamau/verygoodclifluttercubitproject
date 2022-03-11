// import 'package:dio/dio.dart';

// import '../models/post_model_trial.dart';
// import 'api_service.dart';
part of very_good_project;

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;
  Future<List<PostModelTrial>> getPostList() async {
    final response = await apiService.getPostData();
    // ignore: unnecessary_null_comparison
    final data = response.data as List<dynamic>;
    return data
        .map(
          (dynamic singlePost) =>
              PostModelTrial.fromJson(singlePost as Map<String, dynamic>),
        )
        .toList();
  }
}
