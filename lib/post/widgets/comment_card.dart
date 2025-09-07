import 'package:flutter/material.dart';
import 'package:masterclass/post/widgets/actions_widget.dart';
import 'package:masterclass/post/widgets/comment_user_details.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommentUserDetails(),
                  Container(
                    constraints: BoxConstraints(maxWidth: 240),
                    child: Text(
                      comment.content,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Reply', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 8),
                      Text(
                        'See Translation',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          LikeWidget(
            commentId: int.parse(comment.id),
            likeCount: comment.likesCount,
          ),
        ],
      ),
    );
  }
}

class LikeWidget extends StatefulWidget {
  final int likeCount;
  final int commentId;
  const LikeWidget({
    super.key,
    required this.likeCount,
    required this.commentId,
  });

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  late int likeCount;
  bool isLiked = false;
  @override
  void initState() {
    likeCount = widget.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () async {
            setState(() {
              if (isLiked) {
                likeCount--;
              } else {
                likeCount++;
                isLiked = !isLiked;
              }
            });

            await updateComment(widget.commentId, likeCount);
          },
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border_outlined,
            color: isLiked ? Colors.red : Colors.grey,
          ),
        ),
        Text('$likeCount', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

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
}
