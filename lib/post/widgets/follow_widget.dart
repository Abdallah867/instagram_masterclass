import 'package:flutter/material.dart';
import 'package:masterclass/post/view.dart';
import 'package:masterclass/post/widgets/follow_button.dart';

class FollowWidget extends StatelessWidget {
  const FollowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: FollowButton(),
        ),

        IconButton(icon: Icon(Icons.more_vert_sharp), onPressed: () {}),
      ],
    );
  }
}
