import 'package:flutter/material.dart';
import 'package:masterclass/post/view.dart';
import 'package:masterclass/post/widgets/account_details.dart';
import 'package:masterclass/post/widgets/follow_widget.dart';

class PostUserDetails extends StatelessWidget {
  const PostUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [AccountDetails(), FollowWidget()],
      ),
    );
  }
}
