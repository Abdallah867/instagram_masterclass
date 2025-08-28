import 'package:flutter/material.dart';
import 'package:masterclass/post/view.dart';
import 'package:masterclass/post/widgets/post_user_details.dart';

import 'actions_widget.dart';

class InstagramCard extends StatelessWidget {
  const InstagramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostUserDetails(),
        Image.network(
          'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
          height: 400,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 4),
        ActionsWidget(),
        SizedBox(height: 8),
        Row(
          children: [
            SizedBox(width: 12),
            Text(
              'according_tips',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 4),
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 240),
                  child: Text(
                    'Beatiful vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
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
