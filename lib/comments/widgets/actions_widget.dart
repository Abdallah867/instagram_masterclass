import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masterclass/comments/comment_list.dart';
import 'package:masterclass/comments/widgets/custom_action.dart';
import 'package:masterclass/post/models/post.dart';

import '../../post/widgets/instagram_card.dart';

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
                    isScrollControlled: true, // to make bottom sheet scrollable
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 700,
                        child: ProviderScope(
                          overrides: [postProvider.overrideWithValue(post)],
                          child: CommentList(postId: int.parse(post.id)),
                        ),
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
