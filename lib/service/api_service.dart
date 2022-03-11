part of very_good_project;

class ApiRepository {
  ApiRepository({
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

class ApiService {
  final Dio _dio = Dio();
  final _baseUrl = ProjectConfig.instance!.values.baseDomain;
  Future<Response<dynamic>> getPostData() async {
    final _mediaApiUrl = '$_baseUrl/posts';
    try {
      final response = await _dio.get<dynamic>(_mediaApiUrl);
      return response;
    } catch (err) {
      print('Error :$err');
      rethrow;
    }
  }
}
