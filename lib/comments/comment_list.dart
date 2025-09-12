import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masterclass/comments/controllers/comment_controller.dart';
import 'package:masterclass/comments/widgets/comment_card.dart';

class CommentList extends ConsumerStatefulWidget {
  final int postId;
  const CommentList({super.key, required this.postId});

  @override
  ConsumerState<CommentList> createState() => _CommentListState();
}

class _CommentListState extends ConsumerState<CommentList> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final commentsAsync = ref.watch(commentsControllerProvider(widget.postId));

    return SafeArea(
      child: commentsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text("Error: $e")),
        data: (comments) {
          return Column(
            children: [
              Expanded(
                child:
                    comments.isEmpty
                        ? const Center(child: Text('No comments available'))
                        : ListView.separated(
                          separatorBuilder:
                              (context, index) => const Divider(height: 12),
                          itemBuilder: (context, index) {
                            final comment = comments[index];
                            return CommentCard(comment: comment);
                          },
                          itemCount: comments.length,
                        ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: "Write a comment...",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final text = commentController.text.trim();
                      if (text.isEmpty) return;

                      await ref
                          .read(
                            commentsControllerProvider(widget.postId).notifier,
                          )
                          .addComment(widget.postId, text);

                      commentController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
