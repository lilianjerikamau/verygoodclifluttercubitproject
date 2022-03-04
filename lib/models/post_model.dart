class Post {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  factory Post.fromMap(Map<String, dynamic> map, singlePost) {
    return Post(
      title: map['title'] as String,
      body: map['body'] as String,
      id: map['id'] as int,
    );
  }
}
