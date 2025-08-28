import 'package:flutter/material.dart';
import 'package:masterclass/post/view.dart';
import 'package:masterclass/post/widgets/custom_action.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomAction(icon: Icons.favorite_border_outlined),
              CustomAction(icon: Icons.comment_outlined),
              CustomAction(icon: Icons.send_outlined),
            ],
          ),

          CustomAction(icon: Icons.bookmark_border_outlined),
        ],
      ),
    );
  }
}
