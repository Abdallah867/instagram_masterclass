class Post {
  final String username;
  final String userImageUrl;
  final String? postImageUrl;
  final String description;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final String userId;
  final String id;

  Post({
    required this.id,
    required this.userId,
    required this.username,
    required this.userImageUrl,
    this.postImageUrl,
    required this.description,
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'].toString(),
      userId: json['userId'] ?? 'ab',
      username: json['title'] ?? 'a',
      userImageUrl: '',
      postImageUrl: json['postImageUrl'],
      description: json['description'] ?? 0,
      likesCount: json['likes'] ?? 0,
      commentsCount: json['comments'] ?? 0,
      sharesCount: json['shares'] ?? 0,
    );
  }

  //   factory Post.toJson(Post post) {
  //   return {
  //     'id':
  //   }
  // }
}
