import 'package:flutter/material.dart';
import 'package:masterclass/comments/models/comment.dart';
import 'package:masterclass/comments/widgets/comment_user_details.dart';
import 'package:masterclass/comments/widgets/like_widget.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
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
                      widget.comment.content,
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
            commentId: int.parse(widget.comment.id),
            likeCount: widget.comment.likesCount,
          ),
        ],
      ),
    );
  }
}
