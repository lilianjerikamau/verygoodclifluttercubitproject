part of very_good_project;

class ProjectValues {
  ProjectValues({
    required this.baseDomain,
  });

  final String baseDomain;
}

class ProjectConfig {
  factory ProjectConfig({required ProjectValues values}) {
    return _instance ??= ProjectConfig._internal(values);
  }

  ProjectConfig._internal(this.values);

  final ProjectValues values;
  static ProjectConfig? _instance;

  static ProjectConfig? get instance => _instance;
}

const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
