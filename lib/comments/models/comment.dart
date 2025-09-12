class Comment {
  final String id;
  final String content;
  final int likesCount;

  Comment({required this.id, required this.content, required this.likesCount});

  factory Comment.fromJson(json) {
    return Comment(
      id: json['id'].toString(),
      content: json['content'],
      likesCount: json['likesCount'],
    );
  }

  // creates new object with updated values (read about state mutability)
  Comment copyWith({String? id, String? content, int? likesCount}) {
    return Comment(
      id: id ?? this.id,
      content: content ?? this.content,
      likesCount: likesCount ?? this.likesCount,
    );
  }
}
