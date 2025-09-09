import 'package:flutter/material.dart';
import 'package:masterclass/post/models/post.dart';
import 'package:masterclass/post/widgets/post_user_details.dart';

import 'actions_widget.dart';

class InstagramCard extends StatelessWidget {
  final Post post;
  const InstagramCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostUserDetails(post: post),
        Image.network(
          post.postImageUrl ??
              'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
          height: 400,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 4),
        ActionsWidget(post: post),
        SizedBox(height: 8),
        Row(
          children: [
            SizedBox(width: 12),
            Text(post.username, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 4),
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 240),
                  child: Text(
                    post.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text('more', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
