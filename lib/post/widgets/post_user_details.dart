import 'package:flutter/material.dart';
import 'package:masterclass/post/models/post.dart';
import 'package:masterclass/post/view.dart';
import 'package:masterclass/post/widgets/account_details.dart';
import 'package:masterclass/post/widgets/follow_widget.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';

class PostUserDetails extends StatelessWidget {
  final Post post;
  const PostUserDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [AccountDetails(username: post.username), FollowWidget()],
      ),
    );
  }
}
