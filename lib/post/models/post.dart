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
      userId: json['userId'].toString(),
      username: json['title'],
      userImageUrl: '',
      description: json['body'],
      likesCount: 0,
      commentsCount: 0,
      sharesCount: 0,
    );
  }
}
