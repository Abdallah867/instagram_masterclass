import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masterclass/comments/controllers/comment_controller.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';

class LikeWidget extends ConsumerStatefulWidget {
  final int likeCount;
  final int commentId;
  const LikeWidget({
    super.key,
    required this.likeCount,
    required this.commentId,
  });

  @override
  ConsumerState<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends ConsumerState<LikeWidget> {
  late int likeCount;
  bool isLiked = false;
  @override
  void initState() {
    likeCount = widget.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = ref.watch(postProvider);
    return Column(
      children: [
        IconButton(
          onPressed: () async {
            setState(() {
              if (isLiked) {
                likeCount--;
              } else {
                likeCount++;
                isLiked = !isLiked;
              }
            });

            await ref
                .read(commentsControllerProvider(post.id).notifier)
                .updateComment(post.id, widget.commentId, likeCount);
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
