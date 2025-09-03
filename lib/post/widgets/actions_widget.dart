import 'package:flutter/material.dart';
import 'package:masterclass/post/models/post.dart';
import 'package:masterclass/post/view.dart';
import 'package:masterclass/post/widgets/comment_card.dart';
import 'package:masterclass/post/widgets/custom_action.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';

class ActionsWidget extends StatelessWidget {
  final Post post;
  const ActionsWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomAction(
                icon: Icons.favorite_border_outlined,
                count: post.likesCount,
                onPressed: () {},
              ),
              CustomAction(
                icon: Icons.comment_outlined,
                count: post.commentsCount,
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 700,
                        child: Column(children: [CommentCard(), CommentCard()]),
                      );
                    },
                  );
                },
              ),
              CustomAction(
                icon: Icons.send_outlined,
                count: post.sharesCount,
                onPressed: () {},
              ),
            ],
          ),

          CustomAction(
            icon: Icons.bookmark_border_outlined,
            onPressed: () {},
            count: null,
          ),
        ],
      ),
    );
  }
}
