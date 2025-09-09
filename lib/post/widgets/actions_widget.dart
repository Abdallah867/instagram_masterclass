import 'package:flutter/material.dart';
import 'package:masterclass/post/models/post.dart';
import 'package:masterclass/post/widgets/comment_card.dart';
import 'package:masterclass/post/widgets/custom_action.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                        child: CommentList(postId: post.id),
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

class CommentList extends StatefulWidget {
  final String postId;
  const CommentList({super.key, required this.postId});

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late Future<List<Comment>> comments;
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    comments = fetchComments(int.parse(widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Comment>>(
        future: comments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final comments = snapshot.data ?? [];
            return comments.isEmpty
                ? Container(
                  child: Column(
                    children: [
                      Text('No comments available'),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(controller: commentController),
                          ),
                          IconButton(
                            onPressed: () {
                              addComment(
                                int.parse(widget.postId),
                                commentController.text,
                              );
                              commentController.clear();
                            },
                            icon: Icon(Icons.send),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                : Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(height: 12),
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return CommentCard(comment: comment);
                      },
                      itemCount: comments.length,
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(controller: commentController),
                        ),

                        IconButton(
                          onPressed: () {
                            addComment(
                              int.parse(widget.postId),
                              commentController.text,
                            );
                            commentController.clear();
                            setState(() {
                              comments.add(
                                Comment(
                                  id: '5',
                                  content: 'content',
                                  likesCount: 0,
                                ),
                              );
                            });
                          },
                          icon: Icon(Icons.send),
                        ),
                      ],
                    ),
                  ],
                );
          }
        },
      ),
    );
  }
}

Future<List<Comment>> fetchComments(int postId) async {
  try {
    final response = await Supabase.instance.client
        .from('comments')
        .select()
        .eq('post_id', postId);
    return response.map((comment) => Comment.fromJson(comment)).toList();
  } catch (e) {
    throw Exception('Error fetching Comments: $e');
  }
}

Future<void> addComment(int postId, String content) async {
  try {
    final response = await Supabase.instance.client.from('comments').insert({
      'content': content,
      'post_id': postId,
    });
    // return response.map((comment) => Comment.fromJson(comment)).toList();
  } catch (e) {
    throw Exception('Error fetching Comments: $e');
  }
}

Future<void> updateComment(int commentId, int likes) async {
  try {
    final response = await Supabase.instance.client
        .from('comments')
        .update({'likesCount': likes})
        .eq('id', commentId);
  } catch (e) {
    throw Exception('Error fetching Comments: $e');
  }
}

Future<void> deleteComment(int commentId) async {
  try {
    final response = await Supabase.instance.client
        .from('comments')
        .delete()
        .eq('id', commentId);

    // return response.map((comment) => Comment.fromJson(comment)).toList();
  } catch (e) {
    throw Exception('Error fetching Comments: $e');
  }
}
