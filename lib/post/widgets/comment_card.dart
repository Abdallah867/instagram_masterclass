import 'package:flutter/material.dart';
import 'package:masterclass/post/widgets/comment_user_details.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

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
                      'text text text text text text text text text text text',
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
          LikeWidget(),
        ],
      ),
    );
  }
}

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key});

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  int likeCount = 0;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (isLiked) {
                likeCount--;
              } else {
                likeCount++;
              }
              isLiked = !isLiked;
            });
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
